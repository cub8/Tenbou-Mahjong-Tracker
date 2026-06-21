import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:yaml/yaml.dart';
part 'yaku_data_source.g.dart';

const configPath = "assets/yaku/config.yml";

class YakuDataSource {
  final List<YakuRecord> _records;

  const YakuDataSource._(this._records);

  static Future<YakuDataSource> load() async {
    final raw = await rootBundle.loadString(configPath);
    final yamlMap = loadYaml(raw) as YamlMap;
    final yakuList = yamlMap["yaku"] as YamlList;

    final records = yakuList
        .map((entry) => YakuRecord.fromYaml(entry as YamlMap))
        .toList();

    return YakuDataSource._(records);
  }

  List<YakuRecord> getAll() => _records;
}

@riverpod
Future<YakuDataSource> yakuDataSource(Ref ref) => YakuDataSource.load();
