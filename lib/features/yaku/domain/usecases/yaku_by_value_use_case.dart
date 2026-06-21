import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_scoring.dart';
import 'package:tenbou_mahjong/features/yaku/domain/models/han_category.dart';
import 'package:tenbou_mahjong/features/yaku/domain/repositories/yaku_repository.dart';
part "yaku_by_value_use_case.g.dart";

class YakuByValueUseCase {
  final YakuRepository _repository;
  const YakuByValueUseCase(this._repository);

  Future<Map<HanCategory, List<YakuRecord>>> groupYakuByValue() async {
    final allYaku = await _repository.getAllYaku();
    final result = <HanCategory, List<YakuRecord>>{};

    for (final yaku in allYaku) {
      final category = _categoryFor(yaku.scoring);
      result.putIfAbsent(category, () => []).add(yaku);
    }

    return result;
  }

  HanCategory _categoryFor(YakuScoring scoring) {
    return switch (scoring) {
      YakuScoringStandard(han: 1) => HanCategory.oneHan,
      YakuScoringStandard(han: 2) => HanCategory.twoHan,
      YakuScoringStandard(han: 3) => HanCategory.threeHan,
      YakuScoringStandard(han: 5) => HanCategory.fiveHan,
      YakuScoringYakuman(multiplier: 1) => HanCategory.yakuman,
      YakuScoringYakuman(multiplier: 2) => HanCategory.doubleYakuman,
      _ => throw FormatException('Scoring not supported: $scoring'),
    };
  }
}

@riverpod
Future<YakuByValueUseCase> yakuByValueUseCase(Ref ref) async {
  final yakuRepository = await ref.watch(yakuRepositoryProvider.future);
  return YakuByValueUseCase(yakuRepository);
}
