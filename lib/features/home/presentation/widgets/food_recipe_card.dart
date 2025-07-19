import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/features/home/presentation/models/food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/widgets/card_body.dart';
import 'package:food_recipe_app/features/home/presentation/widgets/rate_container.dart';

class FoodRecipeCard extends StatelessWidget {
  const FoodRecipeCard({super.key, required this.foodRecipe});
  final FoodRecipe foodRecipe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 176.h,
          width: 150.w,
          margin: const EdgeInsets.all(8.0),
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
            title: foodRecipe.title,
            time: '${foodRecipe.duration} min',
            isBookmarked: false,
            onPressed: () {},
          ),
        ),
        Positioned(
          top: -50.h,
          left: 10.w,
          right: 10.w,
          child: Stack(
            children: [
              Image.asset(foodRecipe.imageUrl),
              Positioned(
                right: 0,
                top: 40.h,
                child: RateContainer(foodRecipe: foodRecipe),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
