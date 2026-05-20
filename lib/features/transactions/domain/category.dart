import 'package:flutter/material.dart';

class FinanceCategory {
  const FinanceCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  final String id;
  final String name;
  final IconData icon;
  final Color color;
}

const categoryIconOptions = [
  Icons.restaurant_rounded,
  Icons.directions_car_rounded,
  Icons.school_rounded,
  Icons.favorite_rounded,
  Icons.movie_rounded,
  Icons.receipt_long_rounded,
  Icons.payments_rounded,
  Icons.shopping_bag_rounded,
  Icons.home_rounded,
  Icons.flight_takeoff_rounded,
  Icons.fitness_center_rounded,
  Icons.auto_awesome_rounded,
];

const categoryColorOptions = [
  Color(0xFF10B981),
  Color(0xFF2563EB),
  Color(0xFFFF6B6B),
  Color(0xFFF59E0B),
  Color(0xFF7C3AED),
  Color(0xFF0EA5E9),
  Color(0xFF14B8A6),
  Color(0xFF64748B),
];

IconData categoryIconByCodePoint(int codePoint) {
  return categoryIconOptions.firstWhere(
    (icon) => icon.codePoint == codePoint,
    orElse: () => Icons.category_rounded,
  );
}

FinanceCategory categoryById(String id, List<FinanceCategory> categories) {
  return categories.firstWhere(
    (category) => category.id == id,
    orElse: () => const FinanceCategory(
      id: 'uncategorized',
      name: 'Sin categoria',
      icon: Icons.category_rounded,
      color: Color(0xFF64748B),
    ),
  );
}
