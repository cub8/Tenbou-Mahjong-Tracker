import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:tenbou_mahjong/objectbox.g.dart';

class ObjectBox {
  final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: p.join(docsDir.path, "tenbou-mahjong-db"),
    );

    return ObjectBox._create(store);
  }
}
