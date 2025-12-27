import 'package:flutter/material.dart';
import 'package:nos/features/traditions/models/tradition_item.dart';

class AddTraditionPage extends StatelessWidget {
  final String categoryTitle;

  AddTraditionPage({super.key, required this.categoryTitle});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova tradição • $categoryTitle')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) return;

                  Navigator.pop(
                    context,
                    TraditionItem(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );
                },
                child: const Text('Salvar tradição'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
