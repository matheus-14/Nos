import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nos/core/theme/app_colors.dart';
import 'package:nos/features/traditions/add_tradition_page.dart';
import 'package:nos/features/traditions/models/tradition_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TraditionsItemsPage extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  const TraditionsItemsPage({
    super.key,
    required this.categoryId,
    required this.categoryTitle,
  });

  @override
  State<TraditionsItemsPage> createState() => _TraditionsItemsPageState();
}

class _TraditionsItemsPageState extends State<TraditionsItemsPage> {
  String get _storageKey => 'traditions_items_${widget.categoryId}';

  final List<TraditionItem> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      setState(() {
        _items.clear();
        _items.addAll(decoded.map((e) => TraditionItem.fromMap(e)).toList());
      });
    }
  }

  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(_items.map((e) => e.toMap()).toList());
    await prefs.setString(_storageKey, jsonString);
  }

  void _addItem(String title, String description) {
    setState(() {
      _items.add(TraditionItem(title: title, description: description));
    });
    _saveItems();
  }

  void _openAddDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Nova tradição'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  _addItem(titleController.text, descriptionController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle)),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma tradição adicionada ainda 💛',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _items[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  AddTraditionPage(categoryTitle: widget.categoryTitle),
            ),
          );

          if (result != null && result is TraditionItem) {
            setState(() {
              _items.add(result);
            });
            _saveItems();
          }
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
