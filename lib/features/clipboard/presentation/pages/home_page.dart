import 'package:copyflow/core/utils/app_colors.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_appbar.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_list.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_searchbar.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/permission_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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

              const PermissionBanner(),

              const SizedBox(height: AppSpacing.lg),

              const Expanded(child: ClipboardList()),
            ],
          ),
        ),
      ),
    );
  }
}
