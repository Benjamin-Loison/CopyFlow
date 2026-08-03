import 'package:hive_ce/hive.dart';

part 'clipboard_item.g.dart';

@HiveType(typeId: 0)
class ClipboardItem extends HiveObject {
  ClipboardItem({
    required this.id,
    required this.text,
    required this.createdAt,
    this.isPinned = false,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final bool isPinned;
}
