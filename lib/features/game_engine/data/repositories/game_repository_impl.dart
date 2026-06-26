import 'dart:convert';

import 'package:tenbou_mahjong/features/game_engine/data/data_sources/event_data_source.dart';
import 'package:tenbou_mahjong/features/game_engine/data/data_sources/game_data_source.dart';
import 'package:tenbou_mahjong/features/game_engine/data/models/event_entity.dart';
import 'package:tenbou_mahjong/features/game_engine/data/models/game_entity.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameDataSource _gameDataSource;
  final EventDataSource _eventDataSource;

  const GameRepositoryImpl(this._gameDataSource, this._eventDataSource);

  @override
  Future<List<Game>> getAllGames() async {
    return _gameDataSource.getAll().map(_gameFromEntity).toList();
  }

  @override
  Future<Game?> getGameById(int id) async {
    final entity = _gameDataSource.getById(id);
    return entity == null ? null : _gameFromEntity(entity);
  }

  @override
  Future<Game> createGame(Game game) async {
    final entity = _gameToEntity(game);
    final id = _gameDataSource.put(entity);
    return game.copyWith(id: id);
  }

  @override
  Future<void> deleteGame(int id) async {
    _eventDataSource.deleteAllForGame(id);
    _gameDataSource.delete(id);
  }

  @override
  Future<void> finishGame(int id) async {
    final entity = _gameDataSource.getById(id);
    if (entity == null) return;
    entity.isFinished = true;
    _gameDataSource.put(entity);
  }

  @override
  Future<List<Event>> getEventsForGame(int gameId) async {
    return _eventDataSource
        .getAllForGame(gameId)
        .map(_eventFromEntity)
        .toList();
  }

  @override
  Future<Event> createEvent(Event event) async {
    final entity = _eventToEntity(event);
    final id = _eventDataSource.put(entity);
    return event.copyWith(id: id);
  }

  @override
  Future<void> deleteEvent(int id) async {
    _eventDataSource.delete(id);
  }

  Game _gameFromEntity(GameEntity entity) {
    return Game(
      id: entity.id == 0 ? null : entity.id,
      eastPlayer: entity.eastPlayer,
      southPlayer: entity.southPlayer,
      westPlayer: entity.westPlayer,
      northPlayer: entity.northPlayer,
      startingPoints: entity.startingPoints,
      gameLength: GameLength.values.byName(entity.gameLength),
      endAtZeroPoints: entity.endAtZeroPoints,
      isFinished: entity.isFinished,
      createdAt: entity.createdAt,
    );
  }

  GameEntity _gameToEntity(Game game) {
    return GameEntity(
      id: game.id ?? 0,
      eastPlayer: game.eastPlayer,
      southPlayer: game.southPlayer,
      westPlayer: game.westPlayer,
      northPlayer: game.northPlayer,
      startingPoints: game.startingPoints,
      gameLength: game.gameLength.name,
      endAtZeroPoints: game.endAtZeroPoints,
      isFinished: game.isFinished,
      createdAt: game.createdAt,
    );
  }

  Event _eventFromEntity(EventEntity entity) {
    return Event(
      id: entity.id == 0 ? null : entity.id,
      gameId: entity.gameId,
      index: entity.index,
      wind: Wind.values.byName(entity.wind),
      round: entity.round,
      honba: entity.honba,
      endType: EndType.values.byName(entity.endType),
      winners: _winnersFromJson(entity.winnersJson),
      loser: entity.loser == null
          ? null
          : PlayerRole.values.byName(entity.loser!),
      tenpai: entity.tenpai.map(PlayerRole.values.byName).toList(),
      riichiDeclarers: entity.riichiDeclarers
          .map(PlayerRole.values.byName)
          .toList(),
      chonbo: entity.chonbo.map(PlayerRole.values.byName).toList(),
    );
  }

  EventEntity _eventToEntity(Event event) {
    return EventEntity(
      id: event.id ?? 0,
      gameId: event.gameId,
      index: event.index,
      wind: event.wind.name,
      round: event.round,
      honba: event.honba,
      endType: event.endType.name,
      winnersJson: _winnersToJson(event.winners),
      loser: event.loser?.name,
      tenpai: event.tenpai.map((role) => role.name).toList(),
      riichiDeclarers: event.riichiDeclarers.map((role) => role.name).toList(),
      chonbo: event.chonbo.map((role) => role.name).toList(),
    );
  }

  String _winnersToJson(List<Winner> winners) {
    return jsonEncode(
      winners
          .map(
            (winner) => {
              'player': winner.player.name,
              'hand': switch (winner.hand) {
                WinningHandStandard(han: final han, fu: final fu) => {
                  'type': 'standard',
                  'han': han,
                  'fu': fu,
                },
                WinningHandYakuman(multiplier: final multiplier) => {
                  'type': 'yakuman',
                  'multiplier': multiplier,
                },
              },
            },
          )
          .toList(),
    );
  }

  List<Winner> _winnersFromJson(String json) {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded.map((raw) {
      final map = raw as Map<String, dynamic>;
      final handMap = map['hand'] as Map<String, dynamic>;
      final hand = switch (handMap['type'] as String) {
        'standard' => WinningHand.standard(
          han: handMap['han'] as int,
          fu: handMap['fu'] as int,
        ),
        'yakuman' => WinningHand.yakuman(
          multiplier: handMap['multiplier'] as int,
        ),
        final type => throw FormatException('Nieznany typ WinningHand: $type'),
      };
      return Winner(
        player: PlayerRole.values.byName(map['player'] as String),
        hand: hand,
      );
    }).toList();
  }
}
