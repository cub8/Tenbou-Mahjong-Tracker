import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/constants/scoring_table.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';

part "calculate_payout_use_case.g.dart";

class PayoutResult {
  final Map<PlayerRole, int> handDeltas;

  final Map<PlayerRole, int> sideDeltas;

  final int riichiSticks;

  const PayoutResult({
    required this.handDeltas,
    required this.sideDeltas,
    required this.riichiSticks,
  });

  Map<PlayerRole, int> get deltas => {
    for (final role in PlayerRole.values)
      role: (handDeltas[role] ?? 0) + (sideDeltas[role] ?? 0),
  };
}

class CalculatePayoutUseCase {
  const CalculatePayoutUseCase();

  PayoutResult call({
    required Event event,
    required PlayerRole dealer,
    required int riichiSticksOnTable,
  }) {
    final handDeltas = {for (final role in PlayerRole.values) role: 0};
    final sideDeltas = {for (final role in PlayerRole.values) role: 0};

    return switch (event.endType) {
      EndType.ron => _ron(
        event,
        dealer,
        riichiSticksOnTable,
        handDeltas,
        sideDeltas,
      ),
      EndType.tsumo => _tsumo(
        event,
        dealer,
        riichiSticksOnTable,
        handDeltas,
        sideDeltas,
      ),
      EndType.ryuukyoku => _ryuukyoku(
        event,
        riichiSticksOnTable,
        handDeltas,
        sideDeltas,
      ),
      EndType.chonbo => _chonbo(
        event,
        dealer,
        riichiSticksOnTable,
        handDeltas,
        sideDeltas,
      ),
    };
  }

  PayoutResult _ron(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> handDeltas,
    Map<PlayerRole, int> sideDeltas,
  ) {
    final loser = event.loser!;
    for (final winner in event.winners) {
      final total = winner.player == dealer
          ? dealerScoreFor(winner.hand).ronTotal!
          : nonDealerScoreFor(winner.hand).ronTotal!;
      handDeltas[winner.player] = handDeltas[winner.player]! + total;
      handDeltas[loser] = handDeltas[loser]! - total;
    }

    final winners = [for (final w in event.winners) w.player];

    final honbaBonus = 300 * event.honba;
    if (honbaBonus > 0) {
      final winner = _atamahane(loser, winners);
      sideDeltas[winner] = sideDeltas[winner]! + honbaBonus;
      sideDeltas[loser] = sideDeltas[loser]! - honbaBonus;
    }

    final pool = _applyRiichiDeclarations(
      event,
      riichiSticksOnTable,
      sideDeltas,
    );
    final stickWinner = _atamahane(loser, winners);
    sideDeltas[stickWinner] = sideDeltas[stickWinner]! + pool;

    return PayoutResult(
      handDeltas: handDeltas,
      sideDeltas: sideDeltas,
      riichiSticks: 0,
    );
  }

  PayoutResult _tsumo(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> handDeltas,
    Map<PlayerRole, int> sideDeltas,
  ) {
    final pool = _applyRiichiDeclarations(
      event,
      riichiSticksOnTable,
      sideDeltas,
    );
    final honbaEach = 100 * event.honba;

    for (final winner in event.winners) {
      if (winner.player == dealer) {
        final score = dealerScoreFor(winner.hand);
        for (final payer in _others(winner.player)) {
          handDeltas[payer] = handDeltas[payer]! - score.tsumoEach;
          handDeltas[winner.player] =
              handDeltas[winner.player]! + score.tsumoEach;
          sideDeltas[payer] = sideDeltas[payer]! - honbaEach;
          sideDeltas[winner.player] = sideDeltas[winner.player]! + honbaEach;
        }
      } else {
        final score = nonDealerScoreFor(winner.hand);
        for (final payer in _others(winner.player)) {
          final pay = payer == dealer
              ? score.tsumoFromDealer
              : score.tsumoFromEach;
          handDeltas[payer] = handDeltas[payer]! - pay;
          handDeltas[winner.player] = handDeltas[winner.player]! + pay;
          sideDeltas[payer] = sideDeltas[payer]! - honbaEach;
          sideDeltas[winner.player] = sideDeltas[winner.player]! + honbaEach;
        }
      }
    }

    final stickWinner = event.winners.first.player;
    sideDeltas[stickWinner] = sideDeltas[stickWinner]! + pool;

    return PayoutResult(
      handDeltas: handDeltas,
      sideDeltas: sideDeltas,
      riichiSticks: 0,
    );
  }

  PayoutResult _ryuukyoku(
    Event event,
    int riichiSticksOnTable,
    Map<PlayerRole, int> handDeltas,
    Map<PlayerRole, int> sideDeltas,
  ) {
    final pool = _applyRiichiDeclarations(
      event,
      riichiSticksOnTable,
      sideDeltas,
    );

    final tenpai = event.tenpai;
    final count = tenpai.length;
    if (count != 0 && count != 4) {
      final noten = [
        for (final role in PlayerRole.values)
          if (!tenpai.contains(role)) role,
      ];
      final perTenpai = 3000 ~/ count;
      final perNoten = 3000 ~/ noten.length;
      for (final role in tenpai) {
        sideDeltas[role] = sideDeltas[role]! + perTenpai;
      }
      for (final role in noten) {
        sideDeltas[role] = sideDeltas[role]! - perNoten;
      }
    }

    return PayoutResult(
      handDeltas: handDeltas,
      sideDeltas: sideDeltas,
      riichiSticks: pool,
    );
  }

  PayoutResult _chonbo(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> handDeltas,
    Map<PlayerRole, int> sideDeltas,
  ) {
    for (final offender in event.chonbo) {
      for (final other in _others(offender)) {
        final amount = (offender == dealer || other == dealer) ? 4000 : 2000;
        handDeltas[other] = handDeltas[other]! + amount;
        handDeltas[offender] = handDeltas[offender]! - amount;
      }
    }

    return PayoutResult(
      handDeltas: handDeltas,
      sideDeltas: sideDeltas,
      riichiSticks: riichiSticksOnTable,
    );
  }

  int _applyRiichiDeclarations(
    Event event,
    int riichiSticksOnTable,
    Map<PlayerRole, int> sideDeltas,
  ) {
    var pool = riichiSticksOnTable;
    for (final declarer in event.riichiDeclarers) {
      sideDeltas[declarer] = sideDeltas[declarer]! - 1000;
      pool += 1000;
    }
    return pool;
  }

  List<PlayerRole> _others(PlayerRole role) => [
    for (final r in PlayerRole.values)
      if (r != role) r,
  ];

  PlayerRole _atamahane(PlayerRole loser, List<PlayerRole> winners) {
    final order = PlayerRole.values;
    final start = order.indexOf(loser);
    for (var i = 1; i <= order.length; i++) {
      final candidate = order[(start + i) % order.length];
      if (winners.contains(candidate)) return candidate;
    }
    return winners.first;
  }
}

@riverpod
CalculatePayoutUseCase calculatePayoutUseCase(Ref ref) =>
    const CalculatePayoutUseCase();
