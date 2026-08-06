import 'package:copyflow/core/utils/app_radius.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:flutter/material.dart';


class PermissionBanner extends StatelessWidget {
  const PermissionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
          ),
          const SizedBox(width: AppSpacing.md),
          const Expanded(
            child: Text(
              "Enable Accessibility to capture clipboard automatically.",
            ),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text("Enable"),
          ),
        ],
      ),
    );
  }
}