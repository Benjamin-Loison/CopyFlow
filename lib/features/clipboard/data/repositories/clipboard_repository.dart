import '../models/clipboard_item.dart';

abstract class ClipboardRepository {
  List<ClipboardItem> getAll();

  Future<void> add(ClipboardItem item);

  Future<void> delete(String id);

  Future<void> update(ClipboardItem item);

  Future<void> clear();
}