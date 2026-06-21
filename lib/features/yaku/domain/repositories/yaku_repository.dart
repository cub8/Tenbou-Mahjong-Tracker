import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/yaku/data/data_sources/yaku_data_source.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:tenbou_mahjong/features/yaku/data/repositories/yaku_repository_impl.dart';

part "yaku_repository.g.dart";

abstract class YakuRepository {
  Future<List<YakuRecord>> getAllYaku();
  Future<YakuRecord?> getYakuById(String id);
}

@riverpod
Future<YakuRepository> yakuRepository(Ref ref) async {
  final dataSource = await ref.watch(yakuDataSourceProvider.future);
  return YakuRepositoryImpl(dataSource);
}
