import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/data/data_sources/event_data_source.dart';
import 'package:tenbou_mahjong/features/game_engine/data/data_sources/game_data_source.dart';
import 'package:tenbou_mahjong/features/game_engine/data/repositories/game_repository_impl.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';

part 'game_repository.g.dart';

abstract class GameRepository {
  Future<List<Game>> getAllGames();
  Future<Game?> getGameById(int id);
  Future<Game> createGame(Game game);
  Future<void> deleteGame(int id);
  Future<void> finishGame(int id);

  Future<List<Event>> getEventsForGame(int gameId);
  Future<Event> createEvent(Event event);
  Future<void> deleteEvent(int id);
}

@riverpod
GameRepository gameRepository(Ref ref) {
  final gameDataSource = ref.watch(gameDataSourceProvider);
  final eventDataSource = ref.watch(eventDataSourceProvider);
  return GameRepositoryImpl(gameDataSource, eventDataSource);
}
