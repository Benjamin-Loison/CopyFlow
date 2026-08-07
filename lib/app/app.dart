import 'package:copyflow/features/clipboard/presentation/pages/home_page.dart';
import 'package:copyflow/features/clipboard/presentation/pages/permission_gate.dart';
import 'package:flutter/material.dart';

class CopyFlowApp extends StatelessWidget {
  const CopyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CopyFlow',
      debugShowCheckedModeBanner: false,
      home: PermissionGateScreen(child: HomePage()),
    );
  }
}
