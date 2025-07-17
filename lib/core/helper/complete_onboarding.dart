import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> completeOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isOnBoarded', true);
  if (!context.mounted) return;
  context.go(AppRouter.loginView);
}
