import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/helper/custom_snackbar.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isIcon: true,
      text: 'Sign In',
      color: AppColors.primaryColor,
      width: double.infinity,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
            if (!context.mounted) return;
            GoRouter.of(context).go(AppRouter.navBar);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              showErrorSnackBar(
                context: context,
                message: 'No user found for that email.',
              );
            } else if (e.code == 'wrong-password') {
              showErrorSnackBar(
                context: context,
                message: 'Wrong password provided for that user.',
              );
            }
          }
        }
      },
    );
  }
}
