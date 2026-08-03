import 'package:copyflow/features/clipboard/data/models/clipboard_item.dart';
import 'package:copyflow/features/clipboard/presentation/providers/clipboard_provider.dart';
import 'package:copyflow/features/clipboard/presentation/widgets/clipboard_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Future<void> _togglePin(ClipboardItem item) async {
    final prov = ref.read(clipboardProvider.notifier);
    await prov.togglePin(item);
  }

  @override
  Widget build(BuildContext context) {
    final clipboardState = ref.watch(clipboardProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Copy Flow'), centerTitle: true),
      body: ListView.builder(
        itemCount: clipboardState.length,
        itemBuilder: (context, index) {
          if (clipboardState.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final cardData = clipboardState[index];
          return ClipboardCard(
            item: cardData,
            onCopy: () {},
            onDelete: () {},
            onPin: () {
              _togglePin(cardData);
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          ref
              .read(clipboardProvider.notifier)
              .addItem(
                ClipboardItem(
                  id: const Uuid().v4(), // shit in notifier
                  text: "Hello CopyFlow",
                  createdAt: DateTime.now(),
                ),
              );
        },
        label: Icon(Icons.add),
      ),
    );
  }
}
