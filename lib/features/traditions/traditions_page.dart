import 'package:flutter/material.dart';
import 'package:nos/features/traditions/data/tradition_categories.dart';
import 'package:nos/features/traditions/tradition_items_page.dart';
import 'package:nos/features/traditions/widgets/tradition_category_card.dart';


class TraditionsPage extends StatelessWidget {
  const TraditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tradições')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: traditionCategories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final category = traditionCategories[index];

            return TraditionCategoryCard(
              category: category,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TraditionsItemsPage(
                      categoryId: category.id,
                      categoryTitle: category.title,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
