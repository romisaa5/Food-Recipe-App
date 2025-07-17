import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
    required this.width,
    this.textcolor,
    this.image,
    this.isborder = true,
  });

  final String text;
  final Color? textcolor;
  final Color color;
  final double width;
  final void Function()? onTap;
  final String? image;
  final bool isborder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 45.h,
        decoration: BoxDecoration(
          border: isborder ? Border.all(color: AppColors.primaryColor) : null,
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[
              Image.asset(image!, width: 24.w, height: 24.h),
              SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: TextAppTheme.textStyle16.copyWith(
                color: textcolor ?? const Color(0xff282A28),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
