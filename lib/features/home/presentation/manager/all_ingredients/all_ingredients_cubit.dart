import 'package:food_recipe_app/features/home/data/models/ingredient/ingredient.dart';

abstract class AllIngredientsState {}

class AllIngredientsInitial extends AllIngredientsState {}

class AllIngredientsLoading extends AllIngredientsState {}

class AllIngredientsSuccess extends AllIngredientsState {
  final Ingredient ingredient;

  AllIngredientsSuccess({required this.ingredient});
}

class AllIngredientsError extends AllIngredientsState {
  final String message;
  AllIngredientsError(this.message);
}
