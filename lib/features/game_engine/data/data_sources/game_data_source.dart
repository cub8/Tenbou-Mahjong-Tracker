import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/core/database/objectbox_provider.dart';
import 'package:tenbou_mahjong/features/game_engine/data/models/game_entity.dart';

part "game_data_source.g.dart";

class GameDataSource {
  final Box<GameEntity> _box;
  const GameDataSource(this._box);

  List<GameEntity> getAll() => _box.getAll();
  GameEntity? getById(int id) => _box.get(id);

  int put(GameEntity entity) => _box.put(entity);
  bool delete(int id) => _box.remove(id);
}

@riverpod
GameDataSource gameDataSource(Ref ref) {
  final objectBox = ref.watch(objectBoxProvider);
  return GameDataSource(objectBox.store.box<GameEntity>());
}
