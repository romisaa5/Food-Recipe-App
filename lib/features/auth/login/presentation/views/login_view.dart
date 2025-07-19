import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/helper/validation_methods.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/widgets/custom_text_form_field.dart';
import 'package:food_recipe_app/features/auth/login/presentation/widgets/login_button.dart';
import 'package:food_recipe_app/features/auth/widgets/auth_switch_text.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_google_facebook_sign_in.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_or.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                40.ph,
                Text('Hello,', style: TextAppTheme.textStyle32),
                Text('Welcome back!', style: TextAppTheme.textStyle20),
                20.ph,
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
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgetPassword);
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextAppTheme.textStyle12.copyWith(
                      color: AppColors.orangeColor,
                    ),
                  ),
                ),
                LoginButton(
                  passwordController: passwordController,
                  emailController: emailController,
                  formKey: formKey,
                ),
                10.ph,
                CustomOr(),
                15.ph,
                CustomGoogleFacebookSignIn(),
                10.ph,
                AuthSwitchText(isLogin: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
