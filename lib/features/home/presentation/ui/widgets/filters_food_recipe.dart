import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe/food_recipe.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/meal.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/food_recipe_card.dart';

class FiltersFoodRecipe extends StatefulWidget {
  const FiltersFoodRecipe({super.key});

  @override
  State<FiltersFoodRecipe> createState() => _FiltersFoodRecipeState();
}

class _FiltersFoodRecipeState extends State<FiltersFoodRecipe> {
  List<Meal> mealAreas = [];
  String? selectedCuisine;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllAreasCubit>(context).getAllAreas();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllAreasCubit, AllAreasState>(
      builder: (context, state) {
        if (state is GetAllAreas) {
          mealAreas = (state).allAreasList.meals ?? [];
          final filteredRecipes =
              mealAreas.where((r) => r.strArea == selectedCuisine).toList();
          return Column(
            children: [
              SizedBox(
                height: 45.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mealAreas.length,
                  itemBuilder: (context, index) {
                    final cuisine = mealAreas[index].strArea ?? '';
                    final isSelected = cuisine == selectedCuisine;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCuisine = cuisine;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.h),
                        margin: EdgeInsets.all(8.h),
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color:
                              isSelected
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            cuisine,
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : AppColors.primaryColor,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              60.ph,
              filteredRecipes.isEmpty
                  ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                      child: Column(
                        spacing: 5.h,
                        children: [
                          Image.asset(
                            'assets/images/no_food.png',
                            height: 150.h,
                          ),
                          Text(
                            'No meals found',
                            style: TextAppTheme.textStyle14,
                          ),
                        ],
                      ),
                    ),
                  )
                  : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return FoodRecipeCard(foodRecipe: FoodRecipe());
                      },
                    ),
                  ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
