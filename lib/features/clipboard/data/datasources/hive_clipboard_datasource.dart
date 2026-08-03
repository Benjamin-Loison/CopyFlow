import 'package:hive_ce/hive.dart';

import '../../../../core/services/hive_service.dart';
import '../models/clipboard_item.dart';

class HiveClipboardDataSource {
  final Box<ClipboardItem> _box = Hive.box<ClipboardItem>(
    HiveService.clipboardBox,
  );

  List<ClipboardItem> getAll() {
    return _box.values.toList().reversed.toList();
  }

  Future<void> add(ClipboardItem item) async {
    await _box.put(item.id, item);
  }

  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> update(ClipboardItem item) async {
    await _box.put(item.id, item);
  }
}
