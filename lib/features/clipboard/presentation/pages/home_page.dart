import 'dart:async';

import 'package:copyflow/core/services/clipboard_bridge.dart';
import 'package:copyflow/core/utils/app_colors.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:copyflow/features/clipboard/presentation/providers/clipboard_provider.dart';
import 'package:copyflow/features/clipboard/presentation/providers/clipboard_search_provider.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_appbar.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_list.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_searchbar.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/permission_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  StreamSubscription<String>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = ClipboardBridge.clipboardStream.listen((newClip) {
      ref.read(clipboardProvider.notifier).onClipboardChanged(newClip);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(filteredClipboardProvider);
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              const ClipboardAppBar(),

              const SizedBox(height: AppSpacing.lg),

              const ClipboardSearchBar(),

              const SizedBox(height: AppSpacing.md),

              // const PermissionBanner(),
              const SizedBox(height: AppSpacing.lg),

              Expanded(child: ClipboardList(items: items)),
            ],
          ),
        ),
      ),
    );
  }
}
