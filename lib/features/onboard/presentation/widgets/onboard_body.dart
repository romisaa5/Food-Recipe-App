import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/complete_onboarding.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';

class OnboardBody extends StatelessWidget {
  const OnboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(flex: 2),
        Image.asset('assets/images/logo.png'),
        Text(
          'Welcome to Food Recipe App',
          style: TextAppTheme.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Discover delicious recipes and share your own creations.',
          style: TextAppTheme.textStyle14.copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 4),
        Text(
          'Get Cooking',
          style: TextAppTheme.textStyle32.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          'Simple way to find Tasty Recipe',
          style: TextAppTheme.textStyle14.copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        CustomButton(
          onTap: () {
            completeOnboarding(context);
          },
          isIcon: true,
          text: 'Start Cooking ',
          color: AppColors.primaryColor,
          width: 243.w,
        ),

        Spacer(flex: 2),
      ],
    );
  }
}
