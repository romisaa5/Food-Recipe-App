import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/rate_container.dart';


class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({
    super.key,
    required this.foodRecipe,
    this.height,
    this.width,
    this.isSaved = false,
    this.onPressed,
  });
  final void Function()? onPressed;
  final Meal foodRecipe;
  final double? height;
  final double? width;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/food.png', fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: .5)),
            ),
            Positioned(right: 10, top: 10, child: RateContainer()),
            if (isSaved)
              Positioned(
                right: 10,
                bottom: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.bookmark,
                      color: AppColors.primaryColorLight,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,
              child: Text(
                foodRecipe.strMeal??'',
                style: TextAppTheme.textStyle14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Text(
                'By Chef John',
                style: TextAppTheme.textStyle12.copyWith(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
