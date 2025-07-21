import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe.dart';

class RateContainer extends StatelessWidget {
  const RateContainer({super.key, required this.foodRecipe});
  final FoodRecipe foodRecipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      width: 45.w,
      decoration: BoxDecoration(
        color: AppColors.lightOrangeColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: AppColors.orangeColor, size: 14.0.sp),
          SizedBox(width: 4.w),
          Text(
            '${foodRecipe.rating}',
            style: TextAppTheme.textStyle12.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
