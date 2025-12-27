import 'package:flutter/material.dart';
import 'package:nos/features/days_with_my_love/days_page.dart';
import 'package:nos/features/home/home_page.dart';
import 'package:nos/features/places_to_go/places_page.dart';
import 'package:nos/features/planning/planning_page.dart';
import 'package:nos/features/plans_and_goals/plans_page.dart';
import 'package:nos/features/traditions/traditions_page.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.traditions: (_) => const TraditionsPage(),
    AppRoutes.daysWithMyLove: (_) => const DaysPage(),
    AppRoutes.plansAndGoals: (_) => const PlansPage(),
    AppRoutes.placesToGo: (_) => const PlacesPage(),
    AppRoutes.planning: (_) => const PlanningPage(),
  };
}
