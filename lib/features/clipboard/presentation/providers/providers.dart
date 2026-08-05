import 'package:copyflow/core/services/clipboard_service.dart';
import 'package:copyflow/core/services/flutter_clipboard_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clipboardServiceProvider = Provider<ClipboardService>(
  (ref) => FlutterClipboardService(),
);
