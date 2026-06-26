import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';

part "finish_game_use_case.g.dart";

class FinishGameUseCase {
  final GameRepository _repository;
  const FinishGameUseCase(this._repository);

  Future<void> call(int gameId) => _repository.finishGame(gameId);
}

@riverpod
FinishGameUseCase finishGameUseCase(Ref ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return FinishGameUseCase(repository);
}
