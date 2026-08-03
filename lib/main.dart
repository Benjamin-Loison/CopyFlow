import 'package:copyflow/app/app.dart';
import 'package:copyflow/core/services/hive_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const ProviderScope(child: CopyFlowApp()));
}


