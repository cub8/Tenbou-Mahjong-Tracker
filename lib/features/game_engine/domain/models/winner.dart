import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
part "winner.freezed.dart";

@freezed
abstract class Winner with _$Winner {
  const factory Winner({
    required PlayerRole player,
    required WinningHand hand,
  }) = _Winner;
}
