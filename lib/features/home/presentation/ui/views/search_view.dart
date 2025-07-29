import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_text_form_field_search.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final List<Meal> meals = [];
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
            // Expanded(
            //   child: GridView.builder(
            //     itemCount: FoodRecipe.foodRecipes.length,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 10.w,
            //       mainAxisSpacing: 10.h,
            //       childAspectRatio: 1,
            //     ),
            //     itemBuilder: (context, index) {
            //       return CustomSearchCard(
            //         foodRecipe:meals[index] ,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
