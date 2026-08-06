import 'package:copyflow/core/utils/app_colors.dart';
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
          onPressed: () {},
          icon: const Icon(
            Icons.settings_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}