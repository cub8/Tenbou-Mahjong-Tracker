import 'package:tenbou_mahjong/features/yaku/data/data_sources/yaku_data_source.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_record.dart';
import 'package:tenbou_mahjong/features/yaku/domain/repositories/yaku_repository.dart';

class YakuRepositoryImpl implements YakuRepository {
  final YakuDataSource _dataSource;
  const YakuRepositoryImpl(this._dataSource);

  @override
  Future<List<YakuRecord>> getAllYaku() async => _dataSource.getAll();

  @override
  Future<YakuRecord?> getYakuById(String id) async {
    final all = await getAllYaku();
    return all.where((y) => y.id == id).firstOrNull;
  }
}
