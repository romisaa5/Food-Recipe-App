part of 'get_meal_by_area_cubit.dart';

abstract class GetMealByAreaState {}

class GetMealByAreaInitial extends GetMealByAreaState {}

class GetMealByAreaLoading extends GetMealByAreaState {}

class GetMealByAreaSuccess extends GetMealByAreaState {
  final FilterByArea meals;
  GetMealByAreaSuccess(this.meals);
}

class GetMealByAreaFailure extends GetMealByAreaState {
  final String errorMessage;
  GetMealByAreaFailure(this.errorMessage);
}
