import 'package:copyflow/features/clipboard/data/models/clipboard_item.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveService {
  HiveService._();

  static const String clipboardBox = 'clipboard_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ClipboardItemAdapter());

    await Hive.openBox<ClipboardItem>(clipboardBox);
  }
}
