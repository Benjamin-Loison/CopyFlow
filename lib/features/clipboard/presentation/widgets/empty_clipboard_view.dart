import 'package:copyflow/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyClipboardView extends StatelessWidget {
  const EmptyClipboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.content_paste_off_rounded,
            size: 72,
            color: AppColors.muted,
          ),
          SizedBox(height: 16),
          Text(
            "No clipboard history",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Copy something and it'll appear here.",
            style: TextStyle(
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}