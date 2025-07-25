import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/filter_meal_by_ingrediant/filter_meal_by_ingrediant.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/star_rate.dart';

class CustomNewRecipesCardBody extends StatelessWidget {
  const CustomNewRecipesCardBody({super.key, required this.foodRecipe});
  final FilterMealByIngrediant foodRecipe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160.w,
            child: Text(
              foodRecipe.strMeal??'No Name',
              style: TextAppTheme.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          StarRate(),
          Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/chief.png'),
              Text(
                'By James Milner',
                style: TextAppTheme.textStyle12.copyWith(color: Colors.grey),
              ),
              10.pw,
              Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
              Text(
                '50 min',
                style: TextAppTheme.textStyle12.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
