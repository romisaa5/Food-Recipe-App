import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/features/home/data/models/filter_by_area/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/card_body.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/rate_container.dart';

class FoodRecipeCard extends StatelessWidget {
  const FoodRecipeCard({super.key, required this.foodRecipe});
  final MealByAreaFilter foodRecipe;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      height: context.height * .25,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 30.h,
            child: Container(
              height: 176.h,
              width: 150.w,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(12.0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CardBody(
                title: foodRecipe.strMeal ?? 'No Name',
                time: '50 min',
                foodRecipe: foodRecipe,
              ),
            ),
          ),
          Positioned(
            top: -3,
            left: 40.w,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  foodRecipe.strMealThumb ?? '',
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/Image.png',
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(right: 30, top: 20.h, child: RateContainer()),
        ],
      ),
    );
  }
}
