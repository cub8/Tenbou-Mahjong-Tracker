import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';

part "create_game_use_case.g.dart";

class CreateGameUseCase {
  final GameRepository _repository;
  const CreateGameUseCase(this._repository);

  Future<Game> call({
    required String eastPlayer,
    required String southPlayer,
    required String westPlayer,
    required String northPlayer,
    required int startingPoints,
    required GameLength gameLength,
    required bool endAtZeroPoints,
  }) async {
    final game = Game(
      eastPlayer: eastPlayer.trim(),
      southPlayer: southPlayer.trim(),
      westPlayer: westPlayer.trim(),
      northPlayer: northPlayer.trim(),
      startingPoints: startingPoints,
      gameLength: gameLength,
      endAtZeroPoints: endAtZeroPoints,
      isFinished: false,
      createdAt: DateTime.now(),
    );
    return _repository.createGame(game);
  }
}

@riverpod
CreateGameUseCase createGameUseCase(Ref ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return CreateGameUseCase(repository);
}
