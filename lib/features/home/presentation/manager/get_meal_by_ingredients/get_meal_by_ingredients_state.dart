part of 'get_meal_by_ingredients_cubit.dart';

@immutable
sealed class GetMealByIngredientsState {}

final class GetMealByIngredientsInitial extends GetMealByIngredientsState {}

class GetMealByIngredientLoading extends GetMealByIngredientsState {}

class GetMealByIngredientSuccess extends GetMealByIngredientsState {
  final FilterMealByIngredientList meals;
  GetMealByIngredientSuccess(this.meals);
}

class GetMealByIngredientFailure extends GetMealByIngredientsState {
  final String errorMessage;
  GetMealByIngredientFailure(this.errorMessage);
}
