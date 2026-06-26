import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';

part "reconstruct_game_state_use_case.g.dart";

class ReconstructGameStateUseCase {
  const ReconstructGameStateUseCase();

  GameState call(Game game, List<Event> events) {
    final initial = GameState(
      players: [
        PlayerState(
          role: PlayerRole.a,
          name: game.eastPlayer,
          points: game.startingPoints,
          isDealer: true,
        ),
        PlayerState(
          role: PlayerRole.b,
          name: game.southPlayer,
          points: game.startingPoints,
          isDealer: false,
        ),
        PlayerState(
          role: PlayerRole.c,
          name: game.westPlayer,
          points: game.startingPoints,
          isDealer: false,
        ),
        PlayerState(
          role: PlayerRole.d,
          name: game.northPlayer,
          points: game.startingPoints,
          isDealer: false,
        ),
      ],
      roundWind: Wind.east,
      round: 1,
      honba: 0,
      riichiSticks: 0,
    );

    if (events.isEmpty) return initial;

    // TODO: full replay (dealer rotation, point transfers, honba, riichi sticks)
    // once event creation exists (next session). Sort events by `index` before
    // processing. For now only the empty-events case is handled correctly.
    return initial;
  }
}

@riverpod
ReconstructGameStateUseCase reconstructGameStateUseCase(Ref ref) =>
    const ReconstructGameStateUseCase();
