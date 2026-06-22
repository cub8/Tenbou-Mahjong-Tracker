import 'package:tenbou_mahjong/features/yaku/data/models/mahjong_tile.dart';

enum MahjongSetType { pair, group, kan }

class MahjongTileSet {
  final List<MahjongTile> tiles;
  final MahjongSetType? setType;

  const MahjongTileSet._(this.tiles, this.setType);

  factory MahjongTileSet.fromYaml(dynamic raw) {
    final tiles = (raw as List).map(_tileFromString).toList();
    final type = switch (tiles.length) {
      2 => MahjongSetType.pair,
      3 => MahjongSetType.group,
      4 => MahjongSetType.kan,
      _ => null,
    };

    return MahjongTileSet._(tiles, type);
  }

  static MahjongTile _tileFromString(dynamic raw) {
    if (raw is String) {
      return MahjongTile.fromString(raw);
    }

    throw ArgumentError("Can't build MahjongTile from non-String: $raw");
  }
}
