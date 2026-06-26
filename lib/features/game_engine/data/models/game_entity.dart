import 'package:objectbox/objectbox.dart';

@Entity()
class GameEntity {
  @Id()
  int id;

  String eastPlayer; // in game Event - A
  String southPlayer; // in game Event - B
  String westPlayer; // in game Event - C
  String northPlayer; // in game Event - D

  int startingPoints;
  String gameLength;
  bool endAtZeroPoints;
  bool isFinished;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  GameEntity({
    this.id = 0,
    required this.eastPlayer,
    required this.southPlayer,
    required this.westPlayer,
    required this.northPlayer,
    required this.startingPoints,
    required this.gameLength,
    required this.endAtZeroPoints,
    required this.createdAt,
    required this.isFinished,
  });
}
