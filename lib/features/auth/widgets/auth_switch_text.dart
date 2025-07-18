import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class AuthSwitchText extends StatelessWidget {
  final bool isLogin;

  const AuthSwitchText({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? "Don't have an account ? " : "Already a member ? ",
          style: TextAppTheme.textStyle12,
        ),
        GestureDetector(
          onTap: () {
            if (isLogin) {
              context.push(AppRouter.registerView);
            } else {
              context.push(AppRouter.loginView);
            }
          },
          child: Text(
            isLogin ? " Sign up" : " Sign in",
            style: TextAppTheme.textStyle12.copyWith(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
