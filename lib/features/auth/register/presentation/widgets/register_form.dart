import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/helper/validation_methods.dart'
    show ValidationMethods;
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/widgets/custom_text_form_field.dart';
import 'package:food_recipe_app/features/auth/register/presentation/widgets/register_button.dart';
import 'package:food_recipe_app/features/auth/widgets/accept_terms_checkbox.dart';
import 'package:food_recipe_app/features/auth/widgets/auth_switch_text.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_google_facebook_sign_in.dart';
import 'package:food_recipe_app/features/auth/widgets/custom_or.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              validator: (value) => ValidationMethods.validateUsername(value),
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
              validator: (value) => ValidationMethods.validatePassword(value),
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
                  (value) => ValidationMethods.validateConfirmPassword(value),
            ),
            const AcceptTermsCheckbox(),
            RegisterButton(
              emailController: emailController,
              passwordController: passwordController,
              nameController: nameController,
              formKey: formKey,
            ),
            CustomOr(),
            15.ph,
            const CustomGoogleFacebookSignIn(),
            const AuthSwitchText(isLogin: false),
          ],
        ),
      ),
    );
  }
}
