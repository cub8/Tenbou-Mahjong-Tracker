import 'package:flutter_test/flutter_test.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/build_score_history_use_case.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/reconstruct_game_state_use_case.dart';

void main() {
  const useCase = BuildScoreHistoryUseCase();
  const reconstruct = ReconstructGameStateUseCase();

  Game game({GameLength gameLength = GameLength.south}) => Game(
    eastPlayer: 'A',
    southPlayer: 'B',
    westPlayer: 'C',
    northPlayer: 'D',
    startingPoints: 25000,
    gameLength: gameLength,
    endAtZeroPoints: false,
    createdAt: DateTime(2026),
  );

  PlayerRole nextSeat(PlayerRole role) {
    final values = PlayerRole.values;
    return values[(values.indexOf(role) + 1) % values.length];
  }

  Event ron({
    required int index,
    required Wind wind,
    required int round,
    required PlayerRole winner,
    required PlayerRole loser,
  }) => Event(
    gameId: 1,
    index: index,
    wind: wind,
    round: round,
    honba: 0,
    endType: EndType.ron,
    winners: [Winner(player: winner, hand: WinningHand.standard(han: 1, fu: 30))],
    loser: loser,
  );

  test('returns one entry per event with round metadata from the event', () {
    final events = [
      ron(index: 0, wind: Wind.east, round: 1, winner: PlayerRole.b, loser: PlayerRole.a),
      ron(index: 1, wind: Wind.east, round: 2, winner: PlayerRole.c, loser: PlayerRole.b),
      ron(index: 2, wind: Wind.east, round: 3, winner: PlayerRole.d, loser: PlayerRole.c),
    ];
    final history = useCase(game(), events);

    expect(history.length, 3);
    expect(history[0].roundWind, Wind.east);
    expect(history[0].round, 1);
    expect(history[1].round, 2);
    expect(history[2].round, 3);
    expect(history[0].endType, EndType.ron);
  });

  test('last entry totals equal the reconstructed end state', () {
    var dealer = PlayerRole.a;
    final events = <Event>[];
    for (var i = 0; i < 3; i++) {
      final winner = nextSeat(dealer);
      events.add(
        ron(index: i, wind: Wind.east, round: i + 1, winner: winner, loser: dealer),
      );
      dealer = nextSeat(dealer);
    }

    final history = useCase(game(), events);
    final state = reconstruct(game(), events);

    for (final role in PlayerRole.values) {
      final points = state.players.firstWhere((p) => p.role == role).points;
      expect(history.last.totals[role], points);
    }
  });

  test('totals accumulate across rounds', () {
    final events = [
      ron(index: 0, wind: Wind.east, round: 1, winner: PlayerRole.b, loser: PlayerRole.a),
    ];
    final history = useCase(game(), events);

    expect(history.single.totals[PlayerRole.b], 26000);
    expect(history.single.totals[PlayerRole.a], 24000);
    expect(history.single.handDeltas[PlayerRole.b], 1000);
    expect(history.single.handDeltas[PlayerRole.a], -1000);
  });
}
