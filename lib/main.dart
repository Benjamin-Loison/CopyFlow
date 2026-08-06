import 'package:copyflow/app/app.dart';
import 'package:copyflow/core/services/hive_service.dart';
import 'package:copyflow/features/clipboard/data/models/clipboard_category.dart';
import 'package:copyflow/features/clipboard/data/models/clipboard_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(ClipboardCategoryAdapter());

  await HiveService.init();

  runApp(const ProviderScope(child: CopyFlowApp()));
}
