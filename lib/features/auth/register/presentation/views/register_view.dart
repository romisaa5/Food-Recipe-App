import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/custom_snackbar.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/helper/validation_methods.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:food_recipe_app/core/widgets/custom_text_form_field.dart';
import 'package:food_recipe_app/features/auth/register/presentation/manager/terms_cubit.dart';
import 'package:food_recipe_app/features/auth/widgets/accept_terms_checkbox.dart';
import 'package:food_recipe_app/features/auth/widgets/auth_switch_text.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_google_facebook_sign_in.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_or.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                20.ph,
                Text('Create an account', style: TextAppTheme.textStyle24),
                Text(
                  'Let’s help you set up your account, it won’t take long.',
                  style: TextAppTheme.textStyle14,
                ),
                20.ph,
                Text(
                  'Name',
                  style: TextAppTheme.textStyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTextFormField(
                  controller: nameController,
                  hintText: 'Enter Your Name',
                  validator:
                      (value) => ValidationMethods.validateUsername(value),
                ),
                Text(
                  'Email',
                  style: TextAppTheme.textStyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTextFormField(
                  controller: emailController,
                  hintText: 'Enter Your Email',
                  validator: (value) => ValidationMethods.validateEmail(value),
                ),
                Text(
                  'Password',
                  style: TextAppTheme.textStyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTextFormField(
                  controller: passwordController,
                  hintText: 'Enter Your Password',
                  validator:
                      (value) => ValidationMethods.validatePassword(value),
                ),
                Text(
                  'Confirm Password',
                  style: TextAppTheme.textStyle14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppTextFormField(
                  controller: passwordConfirmController,
                  hintText: 'Confirm Your Password',
                  validator:
                      (value) =>
                          ValidationMethods.validateConfirmPassword(value),
                ),
                AcceptTermsCheckbox(),
                CustomButton(
                  isIcon: true,
                  text: 'Sign In',
                  color: AppColors.primaryColor,
                  width: double.infinity,
                  onTap: () {
                    final isChecked = context.read<TermsCubit>().state;

                    if (!isChecked) {
                      showErrorSnackBar(
                        context: context,
                        message: 'Please accept the Terms & Conditions',
                      );
                      return;
                    }

                    if (formKey.currentState!.validate()) {
                      GoRouter.of(context).push(AppRouter.navBar);
                    }
                  },
                ),
                10.ph,
                CustomOr(),
                15.ph,
                CustomGoogleFacebookSignIn(),
                10.ph,
                AuthSwitchText(isLogin: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
