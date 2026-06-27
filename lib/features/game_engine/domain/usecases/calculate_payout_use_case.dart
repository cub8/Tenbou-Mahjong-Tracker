import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/constants/scoring_table.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';

part "calculate_payout_use_case.g.dart";

class PayoutResult {
  final Map<PlayerRole, int> deltas;

  final int riichiSticks;

  const PayoutResult({required this.deltas, required this.riichiSticks});
}

class CalculatePayoutUseCase {
  const CalculatePayoutUseCase();

  PayoutResult call({
    required Event event,
    required PlayerRole dealer,
    required int riichiSticksOnTable,
  }) {
    final deltas = {for (final role in PlayerRole.values) role: 0};

    return switch (event.endType) {
      EndType.ron => _ron(event, dealer, riichiSticksOnTable, deltas),
      EndType.tsumo => _tsumo(event, dealer, riichiSticksOnTable, deltas),
      EndType.ryuukyoku => _ryuukyoku(event, riichiSticksOnTable, deltas),
      EndType.chonbo => _chonbo(event, dealer, riichiSticksOnTable, deltas),
    };
  }

  PayoutResult _ron(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> deltas,
  ) {
    final loser = event.loser!;
    for (final winner in event.winners) {
      final total = winner.player == dealer
          ? dealerScoreFor(winner.hand).ronTotal!
          : nonDealerScoreFor(winner.hand).ronTotal!;
      deltas[winner.player] = deltas[winner.player]! + total;
      deltas[loser] = deltas[loser]! - total;
    }

    final winners = [for (final w in event.winners) w.player];

    final honbaBonus = 300 * event.honba;
    if (honbaBonus > 0) {
      final winner = _atamahane(loser, winners);
      deltas[winner] = deltas[winner]! + honbaBonus;
      deltas[loser] = deltas[loser]! - honbaBonus;
    }

    final pool = _applyRiichiDeclarations(event, riichiSticksOnTable, deltas);
    final stickWinner = _atamahane(loser, winners);
    deltas[stickWinner] = deltas[stickWinner]! + pool;

    return PayoutResult(deltas: deltas, riichiSticks: 0);
  }

  PayoutResult _tsumo(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> deltas,
  ) {
    final pool = _applyRiichiDeclarations(event, riichiSticksOnTable, deltas);
    final honbaEach = 100 * event.honba;

    for (final winner in event.winners) {
      if (winner.player == dealer) {
        final score = dealerScoreFor(winner.hand);
        for (final payer in _others(winner.player)) {
          final amount = score.tsumoEach + honbaEach;
          deltas[payer] = deltas[payer]! - amount;
          deltas[winner.player] = deltas[winner.player]! + amount;
        }
      } else {
        final score = nonDealerScoreFor(winner.hand);
        for (final payer in _others(winner.player)) {
          final pay = payer == dealer
              ? score.tsumoFromDealer
              : score.tsumoFromEach;
          final amount = pay + honbaEach;
          deltas[payer] = deltas[payer]! - amount;
          deltas[winner.player] = deltas[winner.player]! + amount;
        }
      }
    }

    // Sticks go to the (first / atamahane) winner.
    final stickWinner = event.winners.first.player;
    deltas[stickWinner] = deltas[stickWinner]! + pool;

    return PayoutResult(deltas: deltas, riichiSticks: 0);
  }

  PayoutResult _ryuukyoku(
    Event event,
    int riichiSticksOnTable,
    Map<PlayerRole, int> deltas,
  ) {
    final pool = _applyRiichiDeclarations(event, riichiSticksOnTable, deltas);

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
        deltas[role] = deltas[role]! + perTenpai;
      }
      for (final role in noten) {
        deltas[role] = deltas[role]! - perNoten;
      }
    }

    return PayoutResult(deltas: deltas, riichiSticks: pool);
  }

  PayoutResult _chonbo(
    Event event,
    PlayerRole dealer,
    int riichiSticksOnTable,
    Map<PlayerRole, int> deltas,
  ) {
    for (final offender in event.chonbo) {
      for (final other in _others(offender)) {
        final amount = (offender == dealer || other == dealer) ? 4000 : 2000;
        deltas[other] = deltas[other]! + amount;
        deltas[offender] = deltas[offender]! - amount;
      }
    }

    return PayoutResult(deltas: deltas, riichiSticks: riichiSticksOnTable);
  }

  int _applyRiichiDeclarations(
    Event event,
    int riichiSticksOnTable,
    Map<PlayerRole, int> deltas,
  ) {
    var pool = riichiSticksOnTable;
    for (final declarer in event.riichiDeclarers) {
      deltas[declarer] = deltas[declarer]! - 1000;
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
