import 'package:food_recipe_app/features/home/data/models/categories/category.dart';

class CategoryList {
  List<Category>? categories;

  CategoryList({this.categories});

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    categories:
        (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };
}
