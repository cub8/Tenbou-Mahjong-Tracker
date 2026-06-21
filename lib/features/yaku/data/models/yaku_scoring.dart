import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';
part 'yaku_scoring.freezed.dart';

@freezed
sealed class YakuScoring with _$YakuScoring {
  const factory YakuScoring.standard(int han) = YakuScoringStandard;
  const factory YakuScoring.yakuman(int multiplier) = YakuScoringYakuman;

  factory YakuScoring.fromYaml(YamlMap node) {
    final isYakuman = node["is_yakuman"] as bool;
    if (isYakuman) {
      final multiplier = node["yakuman_multiplier"] as int;
      return YakuScoring.yakuman(multiplier);
    }

    final han = node["han"] as int;
    return YakuScoring.standard(han);
  }
}
