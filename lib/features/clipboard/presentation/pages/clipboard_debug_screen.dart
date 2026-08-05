import 'package:copyflow/core/services/clipboard_bridge.dart';
import 'package:flutter/material.dart';

class ClipboardDebugScreen extends StatefulWidget {
  const ClipboardDebugScreen({super.key});

  @override
  State<ClipboardDebugScreen> createState() => _ClipboardDebugScreenState();
}

class _ClipboardDebugScreenState extends State<ClipboardDebugScreen> {
  final List<String> _clips = [];
  final List<String> _logs = [];
  bool _accessibilityEnabled = false;
  bool _overlayEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkStatus();

    ClipboardBridge.clipboardStream.listen((newClip) {
      setState(() {
        _clips.insert(0, newClip);
      });
    });

    ClipboardBridge.debugLogStream.listen((log) {
      setState(() {
        _logs.insert(0, log);
      });
    });
  }

  Future<void> _checkStatus() async {
    final accessibility = await ClipboardBridge.isAccessibilityServiceEnabled();
    final overlay = await ClipboardBridge.hasOverlayPermission();
    setState(() {
      _accessibilityEnabled = accessibility;
      _overlayEnabled = overlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clipboard Debug'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _checkStatus),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Accessibility Service'),
            trailing: Icon(
              _accessibilityEnabled ? Icons.check_circle : Icons.cancel,
              color: _accessibilityEnabled ? Colors.green : Colors.red,
            ),
            onTap: () => ClipboardBridge.openAccessibilitySettings(),
          ),
          ListTile(
            title: const Text('Overlay Permission'),
            trailing: Icon(
              _overlayEnabled ? Icons.check_circle : Icons.cancel,
              color: _overlayEnabled ? Colors.green : Colors.red,
            ),
            onTap: () => ClipboardBridge.requestOverlayPermission(),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Debug Log', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: _logs.length,
              itemBuilder: (context, index) =>
                  Text(_logs[index], style: const TextStyle(fontSize: 12)),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Captured Clips', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: _clips.isEmpty
                ? const Center(child: Text('Nothing copied yet'))
                : ListView.builder(
                    itemCount: _clips.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(title: Text(_clips[index])),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}