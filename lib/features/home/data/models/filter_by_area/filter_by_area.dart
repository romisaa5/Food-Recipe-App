import 'meal.dart';

class FilterByArea {
  List<MealByAreaFilter>? meals;

  FilterByArea({this.meals});

  factory FilterByArea.fromJson(Map<String, dynamic> json) => FilterByArea(
    meals:
        (json['meals'] as List<dynamic>?)
            ?.map((e) => MealByAreaFilter.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };
}
