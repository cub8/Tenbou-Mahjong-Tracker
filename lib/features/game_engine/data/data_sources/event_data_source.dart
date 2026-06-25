import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/core/database/objectbox_provider.dart';
import 'package:tenbou_mahjong/features/game_engine/data/models/event_entity.dart';
import 'package:tenbou_mahjong/objectbox.g.dart';

part "event_data_source.g.dart";

class EventDataSource {
  final Box<EventEntity> _box;
  const EventDataSource(this._box);

  List<EventEntity> getAllForGame(int gameId) =>
      _box.query(EventEntity_.gameId.equals(gameId)).build().find();

  int put(EventEntity entity) => _box.put(entity);
  bool delete(int id) => _box.remove(id);
  void deleteAllForGame(int gameId) {
    _box.query(EventEntity_.gameId.equals(gameId)).build().remove();
  }
}

@riverpod
EventDataSource eventDataSource(Ref ref) {
  final objectBox = ref.watch(objectBoxProvider);
  return EventDataSource(objectBox.store.box<EventEntity>());
}
