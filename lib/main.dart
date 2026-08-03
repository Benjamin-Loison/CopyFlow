import 'package:copyflow/core/services/hive_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const ProviderScope(child: CopyFlowApp()));
}

class CopyFlowApp extends StatelessWidget {
  const CopyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
