import 'package:flutter_test/flutter_test.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/reconstruct_game_state_use_case.dart';

void main() {
  const useCase = ReconstructGameStateUseCase();

  Game game({
    GameLength gameLength = GameLength.south,
    int startingPoints = 25000,
    bool endAtZeroPoints = false,
  }) => Game(
    eastPlayer: 'A',
    southPlayer: 'B',
    westPlayer: 'C',
    northPlayer: 'D',
    startingPoints: startingPoints,
    gameLength: gameLength,
    endAtZeroPoints: endAtZeroPoints,
    createdAt: DateTime(2026),
  );

  Event ron({
    required int index,
    required PlayerRole winner,
    required PlayerRole loser,
    int han = 1,
    int fu = 30,
  }) => Event(
    gameId: 1,
    index: index,
    wind: Wind.east,
    round: 1,
    honba: 0,
    endType: EndType.ron,
    winners: [
      Winner(
        player: winner,
        hand: WinningHand.standard(han: han, fu: fu),
      ),
    ],
    loser: loser,
  );

  PlayerRole nextSeat(PlayerRole role) {
    final values = PlayerRole.values;
    return values[(values.indexOf(role) + 1) % values.length];
  }

  List<Event> nonDealerWinChain(int count) {
    final events = <Event>[];
    var dealer = PlayerRole.a;
    for (var i = 0; i < count; i++) {
      final winner = nextSeat(dealer);
      events.add(ron(index: i, winner: winner, loser: dealer));
      dealer = nextSeat(dealer);
    }
    return events;
  }

  test('empty events give the initial state', () {
    final state = useCase(game(), []);
    expect(state.dealer.role, PlayerRole.a);
    expect(state.roundWind, Wind.east);
    expect(state.round, 1);
    expect(state.honba, 0);
    expect(state.riichiSticks, 0);
    expect(state.isFinished, false);
    expect(state.players.every((p) => p.points == 25000), true);
  });

  test('non-dealer ron rotates the dealer and advances the round', () {
    final state = useCase(game(), [
      ron(index: 0, winner: PlayerRole.b, loser: PlayerRole.c),
    ]);
    expect(state.dealer.role, PlayerRole.b);
    expect(state.roundWind, Wind.east);
    expect(state.round, 2);
    expect(state.honba, 0);
    final b = state.players.firstWhere((p) => p.role == PlayerRole.b);
    final c = state.players.firstWhere((p) => p.role == PlayerRole.c);
    expect(b.points, 26000);
    expect(c.points, 24000);
  });

  test('dealer win keeps the dealer and bumps honba', () {
    final state = useCase(game(), [
      ron(index: 0, winner: PlayerRole.a, loser: PlayerRole.c),
    ]);
    expect(state.dealer.role, PlayerRole.a);
    expect(state.roundWind, Wind.east);
    expect(state.round, 1);
    expect(state.honba, 1);
  });

  test('four non-dealer wins advance East 4 into South 1', () {
    final state = useCase(game(), nonDealerWinChain(4));
    expect(state.roundWind, Wind.south);
    expect(state.round, 1);
    expect(state.dealer.role, PlayerRole.a);
    expect(state.isFinished, false);
  });

  test('hanchan completes when the South-4 dealer changes', () {
    final state = useCase(game(), nonDealerWinChain(8));
    expect(state.isFinished, true);
    expect(state.roundWind, Wind.south);
    expect(state.round, 4);
  });

  test('renchan in All Last keeps the game going', () {
    final events = nonDealerWinChain(7);
    events.add(ron(index: 7, winner: PlayerRole.d, loser: PlayerRole.a));

    final afterRenchan = useCase(game(), events);
    expect(afterRenchan.dealer.role, PlayerRole.d);
    expect(afterRenchan.roundWind, Wind.south);
    expect(afterRenchan.round, 4);
    expect(afterRenchan.honba, 1);
    expect(afterRenchan.isFinished, false);

    final ended = useCase(game(), [
      ...events,
      ron(index: 8, winner: PlayerRole.a, loser: PlayerRole.d),
    ]);
    expect(ended.isFinished, true);
  });

  test('endAtZeroPoints completes the game when a player drops to <= 0', () {
    final state = useCase(game(endAtZeroPoints: true), [
      Event(
        gameId: 1,
        index: 0,
        wind: Wind.east,
        round: 1,
        honba: 0,
        endType: EndType.ron,
        winners: const [
          Winner(
            player: PlayerRole.b,
            hand: WinningHand.yakuman(multiplier: 1),
          ),
        ],
        loser: PlayerRole.c,
      ),
    ]);
    final c = state.players.firstWhere((p) => p.role == PlayerRole.c);
    expect(c.points, lessThanOrEqualTo(0));
    expect(state.isFinished, true);
  });
}
