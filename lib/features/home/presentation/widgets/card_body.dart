import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.title,
    required this.time,
    required this.isBookmarked,
    this.onPressed,
  });
  final String title;
  final String time;
  final bool isBookmarked;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          45.ph,
          Text(
            title,
            style: TextAppTheme.textStyle14.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Time',
              style: TextAppTheme.textStyle12.copyWith(color: Colors.black54),
            ),
            subtitle: Text(
              time,
              style: TextAppTheme.textStyle12.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: CircleAvatar(
              radius: 12.r,
              backgroundColor: Colors.white,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color:
                      isBookmarked
                          ? AppColors.primaryColor
                          : AppColors.darkGreyColor,
                  size: 16.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
