import 'package:copyflow/features/clipboard/presentation/providers/clipboard_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final clipboardSearchProvider = StateProvider<String>((ref) => '');

final filteredClipboardProvider = Provider((ref) {
  final query = ref.watch(clipboardSearchProvider).trim().toLowerCase();

  final items = ref.watch(clipboardProvider);

  if (query.isEmpty) return items;

  return items.where((item) {
    return item.text.toLowerCase().contains(query);
  }).toList();
});