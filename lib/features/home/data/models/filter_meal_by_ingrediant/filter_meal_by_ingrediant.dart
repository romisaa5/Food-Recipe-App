class FilterMealByIngrediant {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  FilterMealByIngrediant({this.strMeal, this.strMealThumb, this.idMeal});

  factory FilterMealByIngrediant.fromJson(Map<String, dynamic> json) => FilterMealByIngrediant(
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
