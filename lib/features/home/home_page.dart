import 'package:flutter/material.dart';
import 'package:nos/core/routes/app_routes.dart';
import 'package:nos/core/widgets/app_icon_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NÓS ❤️'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            AppIconTile(
              icon: Icons.family_restroom,
              label: 'Tradições',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.traditions);
              },
            ),
            AppIconTile(
              icon: Icons.calendar_month,
              label: 'Dias com meu amor',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.daysWithMyLove);
              },
            ),
            AppIconTile(
              icon: Icons.bookmarks,
              label: 'Nossos planos e metas',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.plansAndGoals);
              },
            ),
            AppIconTile(
              icon: Icons.location_on,
              label: 'Lugares para conhecermos',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.placesToGo);
              },
            ),
            AppIconTile(
              icon: Icons.workspace_premium,
              label: 'Planejamento\n(Premium)',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.planning);
              },
            ),
          ],
        ),
      ),
    );
  }
}
