import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/helper/validation_methods.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/widgets/custom_text_form_field.dart';
import 'package:food_recipe_app/features/auth/login/presentation/widgets/forget_password_button.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: TextAppTheme.textStyle16.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.h),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              Text(
                'We’ll send you an email with instructions to reset your password.',
                style: TextAppTheme.textStyle14,
              ),
              Text(
                'Enter your email to reset your password',
                style: TextAppTheme.textStyle14.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              AppTextFormField(
                controller: emailController,
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                validator: (value) => ValidationMethods.validateEmail(value),
              ),
              ForgetPasswordButton(emailController: emailController),
            ],
          ),
        ),
      ),
    );
  }
}
