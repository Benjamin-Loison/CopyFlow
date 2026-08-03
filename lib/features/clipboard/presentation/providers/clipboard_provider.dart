import 'package:copyflow/features/clipboard/data/datasources/hive_clipboard_datasource.dart';
import 'package:copyflow/features/clipboard/data/models/clipboard_item.dart';
import 'package:copyflow/features/clipboard/data/repositories/clipboard_repository.dart';
import 'package:copyflow/features/clipboard/data/repositories/hive_clipboard_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hiveClipboardDataSourceProvider = Provider<HiveClipboardDataSource>((
  ref,
) {
  return HiveClipboardDataSource();
});

final clipboardRepositoryProvider = Provider<ClipboardRepository>((ref) {
  return HiveClipboardRepository(ref.read(hiveClipboardDataSourceProvider));
});
final clipboardProvider =
    NotifierProvider<ClipboardNotifier, List<ClipboardItem>>(
      ClipboardNotifier.new,
    );

class ClipboardNotifier extends Notifier<List<ClipboardItem>> {
  @override
  List<ClipboardItem> build() {
    return ref.read(clipboardRepositoryProvider).getAll();
  }

  Future<void> addItem(ClipboardItem item) async {
    final repository = ref.read(clipboardRepositoryProvider);

    await repository.add(item);
    state = repository.getAll();
  }

  Future<void> deleteItem(String id) async {
    final repository = ref.read(clipboardRepositoryProvider);
    await repository.delete(id);
    state = repository.getAll();
  }

  Future<void> pinItem(String id) async {}

  Future<void> togglePin(ClipboardItem item) async {
    final repository = ref.read(clipboardRepositoryProvider);
    final updatedItem = ClipboardItem(
      id: item.id,
      text: item.text,
      createdAt: item.createdAt,
      isPinned: !item.isPinned,
    );

    await repository.update(updatedItem);

    state = repository.getAll();
  }

  Future<void> clear() async {
    final repository = ref.read(clipboardRepositoryProvider);
    await repository.clear();
    state = [];
  }
}
