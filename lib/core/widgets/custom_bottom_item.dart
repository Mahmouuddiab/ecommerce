import 'package:ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomItem extends BottomNavigationBarItem{
  Icon icon;
  String label;
  CustomBottomItem({required this.icon,required this.label}):super(
    icon: icon,
    label: label,
    activeIcon: CircleAvatar(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      radius: 25,
      child: icon,
    )
  );
}