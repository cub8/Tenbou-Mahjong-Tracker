import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
part "event.freezed.dart";

@freezed
abstract class Event with _$Event {
  const factory Event({
    int? id,
    required int gameId,
    required int index,
    required Wind wind,
    required int round,
    required int honba,
    required EndType endType,
    @Default([]) List<Winner> winners,
    PlayerRole? loser,
    @Default([]) List<PlayerRole> tenpai,
    @Default([]) List<PlayerRole> riichiDeclarers,
    @Default([]) List<PlayerRole> chonbo,
  }) = _Event;
}
