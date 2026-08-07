import 'package:copyflow/features/clipboard/data/models/clipboard_category.dart';
import 'package:flutter/material.dart';

class ClipboardCategoryChip extends StatelessWidget {
  final ClipboardCategory category;

  const ClipboardCategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(category.name.toUpperCase()),
      visualDensity: VisualDensity.compact,
    );
  }
}
