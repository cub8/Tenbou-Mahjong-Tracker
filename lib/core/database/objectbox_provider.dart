import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/core/database/objectbox.dart';

part "objectbox_provider.g.dart";

@Riverpod(keepAlive: true)
ObjectBox objectBox(Ref ref) {
  throw UnimplementedError(
    "objectBoxProvider musi być nadpisany przez overrideWithValue w ProviderScope w main.dart",
  );
}
