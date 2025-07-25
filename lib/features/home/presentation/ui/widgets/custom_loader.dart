import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class CustomLoader extends StatelessWidget {
  final String? message;

  const CustomLoader({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Center(
        child: Column(
          spacing: 10.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitFadingCircle(color: AppColors.primaryColor, size: 50.0),
            if (message != null) ...[
              Text(
                message!,
                style: TextAppTheme.textStyle16.copyWith(color: Colors.black),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
