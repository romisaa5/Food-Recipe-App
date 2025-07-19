import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/presentation/models/food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/widgets/custom_search_card.dart';
import 'package:food_recipe_app/features/home/presentation/widgets/custom_text_form_field_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search recipes', style: TextAppTheme.textStyle18),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.ph,
            CustomTextFormFieldSearch(readOnly: false),
            Text(
              'Search Result',
              style: TextAppTheme.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: FoodRecipe.foodRecipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return CustomSearchCard(
                    foodRecipe: FoodRecipe.foodRecipes[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
