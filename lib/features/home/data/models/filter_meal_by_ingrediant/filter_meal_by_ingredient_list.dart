import 'package:food_recipe_app/features/home/data/models/filter_meal_by_ingrediant/filter_meal_by_ingrediant.dart';

class FilterMealByIngredientList {
  List<FilterMealByIngrediant>? meals;

  FilterMealByIngredientList({this.meals});

  factory FilterMealByIngredientList.fromJson(Map<String, dynamic> json) {
    return FilterMealByIngredientList(
      meals:
          (json['meals'] as List<dynamic>?)
              ?.map(
                (e) =>
                    FilterMealByIngrediant.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };
}
