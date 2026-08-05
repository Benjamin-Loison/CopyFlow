import 'package:flutter/services.dart';

class ClipboardBridge {
  static const _methodChannel = MethodChannel('copyflow/methods');
  static const _eventChannel = EventChannel('copyflow/clipboard_stream');

  static const _debugChannel = EventChannel('copyflow/debug_stream');

  static Stream<String> get debugLogStream =>
      _debugChannel.receiveBroadcastStream().map((event) => event as String);

  static Stream<String> get clipboardStream =>
      _eventChannel.receiveBroadcastStream().map((event) => event as String);

  static Future<bool> hasOverlayPermission() async {
    return await _methodChannel.invokeMethod('hasOverlayPermission');
  }

  static Future<void> requestOverlayPermission() async {
    await _methodChannel.invokeMethod('requestOverlayPermission');
  }

  static Future<bool> isAccessibilityServiceEnabled() async {
    return await _methodChannel.invokeMethod('isAccessibilityServiceEnabled');
  }

  static Future<void> openAccessibilitySettings() async {
    await _methodChannel.invokeMethod('openAccessibilitySettings');
  }
}
