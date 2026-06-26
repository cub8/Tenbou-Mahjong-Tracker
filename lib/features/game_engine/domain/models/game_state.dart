import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
part "game_state.freezed.dart";

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required List<PlayerState> players, // always 4, in role order A, B, C, D
    required Wind roundWind,
    required int round,
    required int honba,
    required int riichiSticks,
  }) = _GameState;

  const GameState._();

  PlayerState get dealer => players.firstWhere((p) => p.isDealer);
}
