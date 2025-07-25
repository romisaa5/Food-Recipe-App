import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/models/filter_meal_by_ingrediant/filter_meal_by_ingredient_list.dart';
import 'package:food_recipe_app/features/home/data/repo/get_meal_by_ingradients_repo.dart';
part 'get_meal_by_ingredients_state.dart';

class GetMealByIngredientsCubit extends Cubit<GetMealByIngredientsState> {
  GetMealByIngredientsCubit(this.getMealByIngradientsRepo)
    : super(GetMealByIngredientsInitial());
  final GetMealByIngradientsRepo getMealByIngradientsRepo;
  Future<void> getMealsByIngredient(String ingredient) async {
    emit(GetMealByIngredientLoading());
    try {
      final meals = await getMealByIngradientsRepo.getMealByIngradients(
        ingredient,
      );
      emit(GetMealByIngredientSuccess(meals));
    } catch (e) {
      emit(GetMealByIngredientFailure(e.toString()));
    }
  }
}
