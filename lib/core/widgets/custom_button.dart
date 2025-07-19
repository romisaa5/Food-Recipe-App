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

    this.isborder = true,
    this.isIcon = false,
    this.hight,
  });

  final String text;
  final Color? textcolor;
  final Color color;
  final double width;
  final void Function()? onTap;
  final bool isborder;
  final bool isIcon;
  final double? hight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: hight ?? 55.h,
        decoration: BoxDecoration(
          border: isborder ? Border.all(color: AppColors.primaryColor) : null,
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextAppTheme.textStyle16.copyWith(
                color: textcolor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (isIcon == true) ...[
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
                size: 18.sp,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
