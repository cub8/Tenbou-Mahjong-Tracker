import 'package:objectbox/objectbox.dart';

@Entity()
class EventEntity {
  @Id()
  int id;

  int gameId;
  int index;
  String wind;
  int round;
  int honba;
  String endType;

  String winnerJson;
  String? loser;
  List<String> tenpai;
  List<String> riichiDeclarers;
  List<String> chonbo;

  EventEntity({
    this.id = 0,
    required this.gameId,
    required this.index,
    required this.wind,
    required this.round,
    required this.honba,
    required this.endType,
    required this.winnerJson,
    this.loser,
    List<String>? tenpai,
    List<String>? riichiDeclarers,
    List<String>? chonbo,
  }) : tenpai = tenpai ?? [],
       riichiDeclarers = riichiDeclarers ?? [],
       chonbo = chonbo ?? [];
}
