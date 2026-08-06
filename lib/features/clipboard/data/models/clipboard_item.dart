import 'package:hive_ce/hive.dart';

import 'clipboard_category.dart';

part 'clipboard_item.g.dart';

@HiveType(typeId: 0)
class ClipboardItem extends HiveObject {
  ClipboardItem({
    required this.id,
    required this.text,
    required this.createdAt,
    this.isPinned = false,
    this.category = ClipboardCategory.text,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final bool isPinned;

  @HiveField(4)
  final ClipboardCategory category;

  ClipboardItem copyWith({
    String? id,
    String? text,
    DateTime? createdAt,
    bool? isPinned,
    ClipboardCategory? category,
  }) {
    return ClipboardItem(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      isPinned: isPinned ?? this.isPinned,
      category: category ?? this.category,
    );
  }
}