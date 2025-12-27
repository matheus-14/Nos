import 'package:flutter/material.dart';
import 'package:nos/core/routes/app_pages.dart';
import 'package:nos/core/routes/app_routes.dart';
import 'package:nos/core/theme/app_theme.dart';

class NosApp extends StatelessWidget {
  const NosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NÓS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.home,
      routes: AppPages.routes,
    );
  }
}
