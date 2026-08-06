import 'package:hive_ce/hive.dart';

part 'clipboard_category.g.dart';

@HiveType(typeId: 1)
enum ClipboardCategory {
  @HiveField(0)
  text,

  @HiveField(1)
  url,

  @HiveField(2)
  email,

  @HiveField(3)
  phone,

  @HiveField(4)
  otp,

  @HiveField(5)
  code,
}