import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
part "game.freezed.dart";

@freezed
abstract class Game with _$Game {
  const factory Game({
    int? id,
    required String eastPlayer, // equivalent of PlayerRole.a
    required String southPlayer, // equivalent of PlayerRole.b
    required String westPlayer, // equivalent of PlayerRole.c
    required String northPlayer, // equivalent of PlayerRole.d
    required int startingPoints,
    required GameLength gameLength,
    required bool endAtZeroPoints,
    required DateTime createdAt,
    @Default(false) bool isFinished,
  }) = _Game;
}
