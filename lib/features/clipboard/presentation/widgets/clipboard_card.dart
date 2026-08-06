import 'package:copyflow/core/utils/app_colors.dart';
import 'package:copyflow/core/utils/app_radius.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:flutter/material.dart';

class ClipboardCard extends StatelessWidget {
  const ClipboardCard({
    super.key,
    required this.text,
    required this.time,
    this.pinned = false,
  });

  final String text;
  final String time;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: AppColors.muted,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.copy_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  pinned
                      ? Icons.push_pin
                      : Icons.push_pin_outlined,
                ),
              ),
              PopupMenuButton(
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Delete"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}