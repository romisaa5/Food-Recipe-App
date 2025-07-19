import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/presentation/models/food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/widgets/custom_new_recipes_card.dart';

class NewRecipeSection extends StatelessWidget {
  const NewRecipeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'New Recipes',
          style: TextAppTheme.textStyle16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        20.ph,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: FoodRecipe.newRecipes.length,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: CustomNewRecipesCard(
                  foodRecipe: FoodRecipe.newRecipes[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
