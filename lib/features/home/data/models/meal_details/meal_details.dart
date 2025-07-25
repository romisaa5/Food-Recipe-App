import 'meal.dart';

class MealDetails {
  List<Meal>? meals;

  MealDetails({this.meals});

  factory MealDetails.fromJson(Map<String, dynamic> json) => MealDetails(
    meals:
        (json['meals'] as List<dynamic>?)
            ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };
}
