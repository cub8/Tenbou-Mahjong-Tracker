import 'package:flutter_test/flutter_test.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/calculate_payout_use_case.dart';

void main() {
  const useCase = CalculatePayoutUseCase();

  Event event({
    required EndType endType,
    List<Winner> winners = const [],
    PlayerRole? loser,
    List<PlayerRole> tenpai = const [],
    List<PlayerRole> riichiDeclarers = const [],
    List<PlayerRole> chonbo = const [],
    int honba = 0,
  }) => Event(
    gameId: 1,
    index: 0,
    wind: Wind.east,
    round: 1,
    honba: honba,
    endType: endType,
    winners: winners,
    loser: loser,
    tenpai: tenpai,
    riichiDeclarers: riichiDeclarers,
    chonbo: chonbo,
  );

  Winner win(PlayerRole player, {int han = 1, int fu = 30}) => Winner(
    player: player,
    hand: WinningHand.standard(han: han, fu: fu),
  );

  void expectSumZero(PayoutResult result, int sticksBefore) {
    final total = result.deltas.values.fold(0, (a, b) => a + b);
    expect(total + result.riichiSticks - sticksBefore, 0);
  }

  test('non-dealer ron, no honba or riichi', () {
    final result = useCase(
      event: event(
        endType: EndType.ron,
        winners: [win(PlayerRole.b)],
        loser: PlayerRole.c,
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(result.deltas[PlayerRole.b], 1000);
    expect(result.deltas[PlayerRole.c], -1000);
    expect(result.deltas[PlayerRole.a], 0);
    expect(result.deltas[PlayerRole.d], 0);
    expect(result.riichiSticks, 0);
    expectSumZero(result, 0);
  });

  test('dealer tsumo 2 han 30 fu: each opponent pays 1000', () {
    final result = useCase(
      event: event(
        endType: EndType.tsumo,
        winners: [win(PlayerRole.a, han: 2, fu: 30)],
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(result.deltas[PlayerRole.a], 3000);
    expect(result.deltas[PlayerRole.b], -1000);
    expect(result.deltas[PlayerRole.c], -1000);
    expect(result.deltas[PlayerRole.d], -1000);
    expectSumZero(result, 0);
  });

  test('non-dealer ron with honba=2 adds 600 from loser to winner', () {
    final result = useCase(
      event: event(
        endType: EndType.ron,
        winners: [win(PlayerRole.b)],
        loser: PlayerRole.c,
        honba: 2,
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(result.deltas[PlayerRole.b], 1600);
    expect(result.deltas[PlayerRole.c], -1600);
    expectSumZero(result, 0);
  });

  test('two riichi declarers then a ron: winner collects both sticks', () {
    final result = useCase(
      event: event(
        endType: EndType.ron,
        winners: [win(PlayerRole.b)],
        loser: PlayerRole.c,
        riichiDeclarers: [PlayerRole.b, PlayerRole.d],
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(
      result.deltas[PlayerRole.b],
      2000,
    ); // -1000 riichi + 1000 ron + 2000 sticks
    expect(result.deltas[PlayerRole.c], -1000);
    expect(result.deltas[PlayerRole.d], -1000);
    expect(result.riichiSticks, 0);
    expectSumZero(result, 0);
  });

  test('ryuukyoku 2 tenpai / 2 noten: +1500 / -1500, sticks stay', () {
    final result = useCase(
      event: event(
        endType: EndType.ryuukyoku,
        tenpai: [PlayerRole.a, PlayerRole.b],
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 1000,
    );
    expect(result.deltas[PlayerRole.a], 1500);
    expect(result.deltas[PlayerRole.b], 1500);
    expect(result.deltas[PlayerRole.c], -1500);
    expect(result.deltas[PlayerRole.d], -1500);
    expect(result.riichiSticks, 1000); // untouched
  });

  test('chonbo by a non-dealer: -8000 split 4000/2000/2000', () {
    final result = useCase(
      event: event(endType: EndType.chonbo, chonbo: [PlayerRole.b]),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 1000,
    );
    expect(result.deltas[PlayerRole.b], -8000);
    expect(result.deltas[PlayerRole.a], 4000); // dealer
    expect(result.deltas[PlayerRole.c], 2000);
    expect(result.deltas[PlayerRole.d], 2000);
    expect(result.riichiSticks, 1000); // accumulated sticks untouched
    expectSumZero(result, 1000);
  });

  test('chonbo by the dealer: -12000 split 4000 each', () {
    final result = useCase(
      event: event(endType: EndType.chonbo, chonbo: [PlayerRole.a]),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(result.deltas[PlayerRole.a], -12000);
    expect(result.deltas[PlayerRole.b], 4000);
    expect(result.deltas[PlayerRole.c], 4000);
    expect(result.deltas[PlayerRole.d], 4000);
    expectSumZero(result, 0);
  });

  test('multi-ron honba and sticks go to the atamahane winner', () {
    // Loser D; winners B and C. Scanning from the seat after D (A, B, ...),
    // B is reached first, so B is the atamahane winner.
    final result = useCase(
      event: event(
        endType: EndType.ron,
        winners: [win(PlayerRole.b), win(PlayerRole.c)],
        loser: PlayerRole.d,
        honba: 1,
        riichiDeclarers: [PlayerRole.a],
      ),
      dealer: PlayerRole.a,
      riichiSticksOnTable: 0,
    );
    expect(
      result.deltas[PlayerRole.b],
      1000 + 300 + 1000,
    ); // ron + honba + stick
    expect(result.deltas[PlayerRole.c], 1000); // ron only
    expect(result.deltas[PlayerRole.d], -2300); // 1000 + 1000 + 300 honba
    expect(result.deltas[PlayerRole.a], -1000); // riichi declaration
    expect(result.riichiSticks, 0);
    expectSumZero(result, 0);
  });
}
