import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/categories/category_list.dart';

class CategoriesRepo {
  final ApiServices apiServices;
  CategoriesRepo({required this.apiServices});
  Future<CategoryList> getAllCategories() async {
    var response = await apiServices.getAllCategories();
    return response;
  }
}
