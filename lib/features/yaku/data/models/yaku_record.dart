import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/mahjong_tile_set.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_scoring.dart';
import 'package:yaml/yaml.dart';
part "yaku_record.freezed.dart";

enum TileDisplayMode { grouped, contiguous }

@freezed
abstract class YakuRecord with _$YakuRecord {
  const factory YakuRecord({
    required String id,
    required String originalJapaneseName,
    required String romanizedJapaneseName,
    required String englishName,
    required String description,
    required TileDisplayMode tileDisplayMode,
    required YakuScoring scoring,
    required List<String> conditions,
    required List<MahjongTileSet> indexTiles,
    required List<List<MahjongTileSet>> variants,
  }) = _YakuRecord;

  factory YakuRecord.fromYaml(YamlMap node) {
    final id = node["id"] as String;
    final originalJapaneseName = node['original_japanese_name'] as String;
    final romanizedJapaneseName = node['romanized_japanese_name'] as String;
    final englishName = node['english_name'] as String;
    final description = node['description'] as String;
    final tileDisplayMode = TileDisplayMode.values.firstWhere(
      (mode) =>
          mode.name == (node['tile_display_mode'] as String? ?? 'grouped'),
    );
    final scoring = YakuScoring.fromYaml(node);
    final conditions = (node['conditions'] as YamlList).cast<String>().toList();
    final indexTiles = (node['index_tiles'] as YamlList)
        .map((set) => MahjongTileSet.fromYaml(set))
        .toList();
    final variants = (node['variants'] as YamlList)
        .map(
          (variant) => (variant as YamlList)
              .map((set) => MahjongTileSet.fromYaml(set))
              .toList(),
        )
        .toList();

    return YakuRecord(
      id: id,
      originalJapaneseName: originalJapaneseName,
      romanizedJapaneseName: romanizedJapaneseName,
      englishName: englishName,
      description: description,
      tileDisplayMode: tileDisplayMode,
      scoring: scoring,
      conditions: conditions,
      indexTiles: indexTiles,
      variants: variants,
    );
  }
}
