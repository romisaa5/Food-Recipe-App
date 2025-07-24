class Meal {
  String? strArea;

  Meal({this.strArea});

  factory Meal.fromJson(Map<String, dynamic> json) =>
      Meal(strArea: json['strArea'] as String?);

  Map<String, dynamic> toJson() => {'strArea': strArea};
}
