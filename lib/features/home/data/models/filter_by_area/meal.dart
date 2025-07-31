class MealByAreaFilter {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealByAreaFilter({this.strMeal, this.strMealThumb, this.idMeal});

  factory MealByAreaFilter.fromJson(Map<String, dynamic> json) =>
      MealByAreaFilter(
        strMeal: json['strMeal'] as String?,
        strMealThumb: json['strMealThumb'] as String?,
        idMeal: json['idMeal'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'strMeal': strMeal,
    'strMealThumb': strMealThumb,
    'idMeal': idMeal,
  };
}
