import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';

part "round_history_entry.freezed.dart";

@freezed
abstract class RoundHistoryEntry with _$RoundHistoryEntry {
  const factory RoundHistoryEntry({
    required Wind roundWind,
    required int round,
    required int honba,
    required EndType endType,
    required Map<PlayerRole, int> handDeltas,
    required Map<PlayerRole, int> sideDeltas,
    required Map<PlayerRole, int> totals,
    @Default([]) List<PlayerRole> chonbo,
  }) = _RoundHistoryEntry;
}
