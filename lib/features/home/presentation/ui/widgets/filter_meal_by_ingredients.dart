import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/features/home/data/models/ingredient/meal_ingredient.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_ingredients/all_ingredients_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_ingredients/all_ingredients_state.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_ingredients/get_meal_by_ingredients_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_loader.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_new_recipes_card.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/empty_card.dart';
import 'package:go_router/go_router.dart';

class FilterMealByIngredients extends StatefulWidget {
  const FilterMealByIngredients({super.key});

  @override
  State<FilterMealByIngredients> createState() =>
      _FilterMealByIngredientsState();
}

class _FilterMealByIngredientsState extends State<FilterMealByIngredients> {
  List<MealIngredient> mealIngredient = [];
  String? selectedIngredient;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllIngredientsCubit>(context).fetchAllIngredients();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllIngredientsCubit, AllIngredientsState>(
      builder: (context, state) {
        if (state is AllIngredientsSuccess) {
          mealIngredient = (state).ingredient.mealsIngredient ?? [];
          if (selectedIngredient == null && mealIngredient.isNotEmpty) {
            selectedIngredient = mealIngredient.first.strIngredient;
            context.read<GetMealByIngredientsCubit>().getMealsByIngredient(
              selectedIngredient!,
            );
          }
          return Column(
            children: [
              SizedBox(
                height: 45.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mealIngredient.length,
                  itemBuilder: (context, index) {
                    final ingredient =
                        mealIngredient[index].strIngredient ?? '';
                    final isSelected = ingredient == selectedIngredient;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIngredient = ingredient;
                        });
                        context
                            .read<GetMealByIngredientsCubit>()
                            .getMealsByIngredient(ingredient);
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
                            ingredient,
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
              20.ph,
              BlocBuilder<GetMealByIngredientsCubit, GetMealByIngredientsState>(
                builder: (context, state) {
                  if (state is GetMealByIngredientLoading) {
                    return const CustomLoader(
                      message: "Fetching delicious meals...",
                    );
                  } else if (state is GetMealByIngredientSuccess) {
                    final filteredMeals = state.meals.meals ?? [];
                    return filteredMeals.isEmpty
                        ? EmptyCard()
                        : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomNewRecipesCard(foodRecipe: meal),
                                ),
                              );
                            },
                          ),
                        );
                  } else if (state is GetMealByIngredientFailure) {
                    return Text(state.errorMessage);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          );
        } else {
          return SizedBox(
            height: 100,
            child: const CustomLoader(message: "Loading Ingredients..."),
          );
        }
      },
    );
  }
}
