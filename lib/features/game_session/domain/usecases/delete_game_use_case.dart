import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';

part "delete_game_use_case.g.dart";

class DeleteGameUseCase {
  final GameRepository _repository;
  const DeleteGameUseCase(this._repository);

  Future<void> call(int gameId) => _repository.deleteGame(gameId);
}

@riverpod
DeleteGameUseCase deleteGameUseCase(Ref ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return DeleteGameUseCase(repository);
}
