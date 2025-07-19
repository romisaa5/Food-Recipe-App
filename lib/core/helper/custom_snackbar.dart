import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';

void showErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 3),
    ),
  );
}

void showDoneSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 3),
    ),
  );
}
