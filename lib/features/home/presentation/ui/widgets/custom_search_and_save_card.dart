import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_save_icon.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/rate_container.dart';
import 'package:go_router/go_router.dart';

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
    return GestureDetector(
      onTap: () {
        final mealId = foodRecipe.idMeal ?? '';
        GoRouter.of(context).push(AppRouter.detailsview, extra: mealId);
      },
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            children: [
              Positioned.fill(
                child:
                    foodRecipe.strMealThumb != null &&
                            foodRecipe.strMealThumb!.isNotEmpty
                        ? Image.network(
                          foodRecipe.strMealThumb!,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Image.asset(
                                'assets/images/food.png',
                                fit: BoxFit.cover,
                              ),
                        )
                        : Image.asset(
                          'assets/images/food.png',
                          fit: BoxFit.cover,
                        ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: .5)),
              ),
              Positioned(right: 10, top: 10, child: RateContainer()),

              Positioned(
                right: 10,
                bottom: 20,
                child: CustomSaveIcon(
                  mealData: {
                    'mealName': foodRecipe.strMeal,
                    'imageUrl': foodRecipe.strMealThumb,
                    'area': foodRecipe.strArea,
                  },
                  mealId: foodRecipe.idMeal!,
                ),
              ),
              Positioned(
                bottom: 40,
                left: 10,
                right: 10,
                child: Text(
                  foodRecipe.strMeal ?? '',
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
      ),
    );
  }
}
