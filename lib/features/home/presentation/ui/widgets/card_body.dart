import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/filter_by_area/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_save_icon.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.title,
    required this.time,
    required this.foodRecipe,
  });
  final String title;
  final String time;
  final MealByAreaFilter foodRecipe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          75.ph,
          Text(
            title,
            style: TextAppTheme.textStyle14.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Time',
              style: TextAppTheme.textStyle12.copyWith(color: Colors.black54),
            ),
            subtitle: Text(
              time,
              style: TextAppTheme.textStyle12.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: CircleAvatar(
              radius: 12.r,
              backgroundColor: Colors.white,
              child: CustomSaveIcon(
                mealData: {
                  'mealName': foodRecipe.strMeal,
                  'imageUrl': foodRecipe.strMealThumb,
                },
                mealId: foodRecipe.idMeal!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
