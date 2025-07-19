import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/helper/custom_snackbar.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:food_recipe_app/features/auth/register/presentation/manager/terms_cubit.dart';
import 'package:go_router/go_router.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;

  const RegisterButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isIcon: true,
      text: 'Sign In',
      color: AppColors.primaryColor,
      width: double.infinity,
      onTap: () async {
        final isChecked = context.read<TermsCubit>().state;
        if (!isChecked) {
          showErrorSnackBar(
            context: context,
            message: 'Please accept the Terms & Conditions',
          );
          return;
        }

        if (formKey.currentState!.validate()) {
          try {
            final nav = GoRouter.of(context);
            final credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
            nav.push(AppRouter.navBar);
            final user = credential.user;
            if (user != null) {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set({
                    'uid': user.uid,
                    'name': nameController.text,
                    'email': emailController.text,
                    'createdAt': FieldValue.serverTimestamp(),
                  });
            }
          } on FirebaseAuthException catch (e) {
            if (!context.mounted) return;
            showErrorSnackBar(
              context: context,
              message:
                  e.code == 'weak-password'
                      ? 'The password provided is too weak.'
                      : e.code == 'email-already-in-use'
                      ? 'The account already exists for that email.'
                      : e.message ?? 'Registration error',
            );
          } catch (e) {
            if (!context.mounted) return;
            showErrorSnackBar(context: context, message: e.toString());
          }
        }
      },
    );
  }
}
