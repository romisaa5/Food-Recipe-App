class MealIngredient {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  dynamic strType;

  MealIngredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
  });

  factory MealIngredient.fromJson(Map<String, dynamic> json) => MealIngredient(
    idIngredient: json['idIngredient'] as String?,
    strIngredient: json['strIngredient'] as String?,
    strDescription: json['strDescription'] as String?,
    strType: json['strType'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'idIngredient': idIngredient,
    'strIngredient': strIngredient,
    'strDescription': strDescription,
    'strType': strType,
  };
}
