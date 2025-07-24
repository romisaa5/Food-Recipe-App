import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe/food_recipe.dart';

class GetMealDetailByIdRepo {
  final ApiServices apiServices;
  GetMealDetailByIdRepo({required this.apiServices});
  Future<FoodRecipe>getMealDetailById(String id) async {
    var response = await apiServices.getMealDetailById(id);
    return response;
  }
}
