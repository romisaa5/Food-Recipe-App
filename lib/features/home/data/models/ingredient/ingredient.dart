import 'meal_ingredient.dart';

class Ingredient {
  List<MealIngredient>? mealsIngredient;

  Ingredient({this.mealsIngredient});

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    mealsIngredient:
        (json['meals'] as List<dynamic>?)
            ?.map((e) => MealIngredient.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': mealsIngredient?.map((e) => e.toJson()).toList(),
  };
}
