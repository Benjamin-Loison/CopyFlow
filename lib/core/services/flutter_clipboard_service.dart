import 'package:flutter/services.dart';

import 'clipboard_service.dart';

class FlutterClipboardService implements ClipboardService {
  static const MethodChannel _methodChannel = MethodChannel(
    'dev.copyflow/clipboard',
  );

  static const EventChannel _eventChannel = EventChannel(
    'dev.copyflow/clipboard/events',
  );

  Stream<String> clipboardStream() {
    return _eventChannel.receiveBroadcastStream().cast<String>();
  }

  @override
  Future<void> copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  Future<String> getAndroidVersion() async {
    final version = await _methodChannel.invokeMethod<String>(
      'getAndroidVersion',
    );

    return version ?? 'Unknown';
  }

  @override
  Future<String?> getClipboardText() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);

    return data?.text;
  }
}
