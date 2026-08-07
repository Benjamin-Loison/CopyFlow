import 'package:copyflow/core/utils/app_colors.dart';
import 'package:copyflow/features/settings/settings.dart';
import 'package:flutter/material.dart';

class ClipboardAppBar extends StatelessWidget {
  const ClipboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "CopyFlow",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
          icon: const Icon(
            Icons.settings_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
