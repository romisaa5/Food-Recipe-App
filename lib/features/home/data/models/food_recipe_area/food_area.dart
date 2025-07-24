import 'package:food_recipe_app/features/home/data/models/food_recipe_area/meal.dart';

class FoodArea {
  List<Meal>? meals;

  FoodArea({this.meals});

  factory FoodArea.fromJson(Map<String, dynamic> json) => FoodArea(
    meals:
        (json['meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };
}
