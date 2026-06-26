import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
part "player_state.freezed.dart";

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState({
    required PlayerRole role,
    required String name,
    required int points,
    required bool isDealer,
  }) = _PlayerState;
}
