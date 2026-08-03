import 'package:copyflow/features/clipboard/data/repositories/clipboard_repository.dart';
import '../datasources/hive_clipboard_datasource.dart';
import '../models/clipboard_item.dart';

class HiveClipboardRepository implements ClipboardRepository {
  HiveClipboardRepository(this._datasource);

  final HiveClipboardDataSource _datasource;

  @override
  List<ClipboardItem> getAll() {
    return _datasource.getAll();
  }

  @override
  Future<void> add(ClipboardItem item) {
    return _datasource.add(item);
  }

  @override
  Future<void> delete(String id) {
    return _datasource.delete(id);
  }

  @override
  Future<void> update(ClipboardItem item) {
    return _datasource.update(item);
  }

  @override
  Future<void> clear() {
    return _datasource.clear();
  }

}