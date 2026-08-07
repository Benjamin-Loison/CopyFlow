import 'package:copyflow/core/utils/app_spacing.dart';
import 'package:copyflow/features/clipboard/data/models/clipboard_item.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_card.dart';
import 'package:flutter/material.dart';

class ClipboardList extends StatelessWidget {
  const ClipboardList({super.key, required this.items});

  final List<ClipboardItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.md),
      itemBuilder: (_, index) {
        return ClipboardCard(
          text: items[index].text,
          time: "2 min ago",
          pinned: index == 0,
        );
      },
    );
  }
}
