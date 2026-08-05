import 'package:copyflow/core/services/clipboard_bridge.dart';
import 'package:flutter/material.dart';

class PermissionGateScreen extends StatefulWidget {
  final Widget child;
  const PermissionGateScreen({super.key, required this.child});

  @override
  State<PermissionGateScreen> createState() => _PermissionGateScreenState();
}

class _PermissionGateScreenState extends State<PermissionGateScreen>
    with WidgetsBindingObserver {
  bool _overlayGranted = false;
  bool _accessibilityGranted = false;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-check when user comes back from the Settings screen
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
  }

  Future<void> _checkPermissions() async {
    final overlay = await ClipboardBridge.hasOverlayPermission();
    final accessibility = await ClipboardBridge.isAccessibilityServiceEnabled();
    setState(() {
      _overlayGranted = overlay;
      _accessibilityGranted = accessibility;
      _checking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_overlayGranted && _accessibilityGranted) {
      return widget.child; // both granted → show the real app
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.content_paste, size: 64),
              const SizedBox(height: 16),
              const Text(
                'copyflow needs two permissions to track your clipboard in the background.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              _PermissionRow(
                title: 'Accessibility Service',
                subtitle: 'Lets copyflow detect when you copy text',
                granted: _accessibilityGranted,
                onTap: () async {
                  await ClipboardBridge.openAccessibilitySettings();
                },
              ),
              const SizedBox(height: 16),
              _PermissionRow(
                title: 'Display over other apps',
                subtitle: 'Lets copyflow read the clipboard in the background',
                granted: _overlayGranted,
                onTap: () async {
                  await ClipboardBridge.requestOverlayPermission();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool granted;
  final VoidCallback onTap;

  const _PermissionRow({
    required this.title,
    required this.subtitle,
    required this.granted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: granted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : ElevatedButton(onPressed: onTap, child: const Text('Grant')),
      ),
    );
  }
}