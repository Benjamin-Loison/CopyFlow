import 'dart:async';

import 'package:copyflow/core/services/clipboard_bridge.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_card.dart';
import 'package:flutter/material.dart';

class ClipboardList extends StatefulWidget {
  const ClipboardList({super.key});

  @override
  State<ClipboardList> createState() => _ClipboardListState();
}

class _ClipboardListState extends State<ClipboardList> {
  final List<String> _clips = [];
  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = ClipboardBridge.clipboardStream.listen((newClip) {
      setState(() {
        _clips.insert(0, newClip); // newest on top
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel(); // important — stops listening when screen closes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _clips.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) {
        return ClipboardCard(
          text: _clips[index],
          time: "2 min ago",
          pinned: index == 0,
        );
      },
    );
  }
}
