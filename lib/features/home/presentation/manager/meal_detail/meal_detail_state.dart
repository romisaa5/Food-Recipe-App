part of 'meal_detail_cubit.dart';

abstract class MealDetailState {}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailSuccess extends MealDetailState {
  final MealDetails recipe;
  MealDetailSuccess(this.recipe);
}

class MealDetailFailure extends MealDetailState {
  final String errorMessage;
  MealDetailFailure(this.errorMessage);
}
