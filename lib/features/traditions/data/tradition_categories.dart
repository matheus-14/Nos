import 'package:flutter/material.dart';
import '../models/tradition_category.dart';

const traditionCategories = [
  TraditionCategory(
    id: 'familiar',
    title: 'Familiar',
    icon: Icons.family_restroom,
  ),
  TraditionCategory(id: 'religiosa', title: 'Religiosa', icon: Icons.church),
  TraditionCategory(id: 'oral', title: 'Oral', icon: Icons.record_voice_over),
  TraditionCategory(
    id: 'material',
    title: 'Material',
    icon: Icons.auto_awesome,
  ),
  TraditionCategory(id: 'festivas', title: 'Festivas', icon: Icons.celebration),
  TraditionCategory(
    id: 'culinaria',
    title: 'Culinária',
    icon: Icons.restaurant,
  ),
  TraditionCategory(id: 'artistica', title: 'Artística', icon: Icons.palette),
];
