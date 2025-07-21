import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';

class FilterOptionButton extends StatelessWidget {
  const FilterOptionButton({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
        foregroundColor: isSelected ? Colors.white : AppColors.primaryColor,
        side: const BorderSide(color: AppColors.primaryColorLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(label),
    );
  }
}
