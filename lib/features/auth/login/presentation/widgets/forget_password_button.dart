import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/helper/custom_snackbar.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, required this.emailController});
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () async {
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(
            email: emailController.text.trim(),
          );
          if (!context.mounted) return;
          showDoneSnackBar(
            context: context,
            message: 'A password reset link has been sent to your email',
          );
          GoRouter.of(context).pop();
        } on FirebaseAuthException catch (e) {
          showErrorSnackBar(
            context: context,
            message: e.message ?? 'Failed to send reset email',
          );
        } catch (e) {
          showErrorSnackBar(context: context, message: 'Something went wrong');
        }
      },

      text: 'Verify Email',
      color: AppColors.primaryColor,
      width: double.infinity,
    );
  }
}
