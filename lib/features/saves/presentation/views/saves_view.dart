import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_search_card.dart';

class SavesView extends StatelessWidget {
  const SavesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10.h,
        children: [
          20.ph,
          Align(
            alignment: Alignment.center,
            child: Text('Saved recipes', style: TextAppTheme.textStyle18),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: FoodRecipe.foodRecipes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSearchCard(
                    isSaved: true,
                    height: 150.h,
                    width: double.infinity,
                    foodRecipe: FoodRecipe.foodRecipes[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
