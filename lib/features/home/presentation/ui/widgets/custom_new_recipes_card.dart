import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_new_recipes_card_body.dart';

class CustomNewRecipesCard extends StatelessWidget {
  const CustomNewRecipesCard({super.key, required this.foodRecipe});
  final FoodRecipe foodRecipe;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 250.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 95.h,
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomNewRecipesCardBody(foodRecipe: foodRecipe),
          ),
          Positioned(
            top: -30.h,
            right: 10.w,
            child: Image.asset(
              foodRecipe.imageUrl,
              height: 86.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
