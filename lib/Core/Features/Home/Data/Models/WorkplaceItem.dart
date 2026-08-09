import 'package:flutter/material.dart';

class WorkplaceItem {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;

  const WorkplaceItem({
    required this.id,
    required this.title,
    required this.subtitle,
    this.icon = Icons.apartment_rounded,
  });
}
