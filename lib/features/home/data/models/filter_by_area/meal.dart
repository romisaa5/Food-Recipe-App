class MealByArea {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealByArea({this.strMeal, this.strMealThumb, this.idMeal});

  factory MealByArea.fromJson(Map<String, dynamic> json) => MealByArea(
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
