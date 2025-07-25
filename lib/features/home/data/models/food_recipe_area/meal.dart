class MealByArea {
  String? strArea;

  MealByArea({this.strArea});

  factory MealByArea.fromJson(Map<String, dynamic> json) =>
      MealByArea(strArea: json['strArea'] as String?);

  Map<String, dynamic> toJson() => {'strArea': strArea};
}
