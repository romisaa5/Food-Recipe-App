import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/meal.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_area/get_meal_by_area_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/empty_card.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/food_recipe_card.dart';
import 'package:go_router/go_router.dart';

class FiltersFoodRecipe extends StatefulWidget {
  const FiltersFoodRecipe({super.key});

  @override
  State<FiltersFoodRecipe> createState() => _FiltersFoodRecipeState();
}

class _FiltersFoodRecipeState extends State<FiltersFoodRecipe> {
  List<MealByArea> mealAreas = [];
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
          if (selectedCuisine == null && mealAreas.isNotEmpty) {
            selectedCuisine = mealAreas.first.strArea;
            context.read<GetMealByAreaCubit>().getMealsByArea(selectedCuisine!);
          }
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
                        context.read<GetMealByAreaCubit>().getMealsByArea(
                          cuisine,
                        );
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
              30.ph,
              BlocBuilder<GetMealByAreaCubit, GetMealByAreaState>(
                builder: (context, state) {
                  if (state is GetMealByAreaLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetMealByAreaSuccess) {
                    final filteredMeals = state.meals.meals ?? [];
                    return filteredMeals.isEmpty
                        ? EmptyCard()
                        : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: filteredMeals.length,
                            itemBuilder: (context, index) {
                              final meal = filteredMeals[index];
                              return GestureDetector(
                                onTap: () {
                                  final mealId = meal.idMeal ?? '';
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.detailsview, extra: mealId);
                                },
                                child: FoodRecipeCard(foodRecipe: meal),
                              );
                            },
                          ),
                        );
                  } else if (state is GetMealByAreaFailure) {
                    return Text(state.errorMessage);
                  } else {
                    return const SizedBox();
                  }
                },
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
