import 'package:copyflow/core/utils/app_colors.dart';
import 'package:copyflow/core/utils/app_radius.dart';
import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/clipboard_item.dart';

class ClipboardCard extends StatelessWidget {
  const ClipboardCard({
    super.key,
    required this.item,
    required this.onCopy,
    required this.onDelete,
    required this.onPin,
  });

  final ClipboardItem item;
  final VoidCallback onCopy;
  final VoidCallback onDelete;
  final VoidCallback onPin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Clipboard Text
            Text(
              item.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  color: AppColors.muted,
                ),

                const SizedBox(width: 6),

                Text(
                  DateFormat("hh:mm a").format(item.createdAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                if (item.isPinned) ...[
                  const SizedBox(width: 12),

                  const Icon(Icons.push_pin_rounded, size: 18),
                ],

                const Spacer(),

                IconButton(
                  tooltip: "Copy",
                  onPressed: onCopy,
                  icon: const Icon(Icons.content_copy_rounded),
                ),

                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'pin':
                        onPin();
                        break;

                      case 'delete':
                        onDelete();
                        break;
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'pin',
                      child: Row(
                        children: [
                          Icon(
                            item.isPinned
                                ? Icons.push_pin_outlined
                                : Icons.push_pin_rounded,
                          ),
                          const SizedBox(width: 10),
                          Text(item.isPinned ? "Unpin" : "Pin"),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline_rounded),
                          SizedBox(width: 10),
                          Text("Delete"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
