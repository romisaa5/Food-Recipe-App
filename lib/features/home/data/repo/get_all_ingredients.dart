import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/ingredient/ingredient.dart';

class GetAllIngredientsRepo {
  final ApiServices apiServices;
  GetAllIngredientsRepo({required this.apiServices});
  Future<Ingredient> getAllIngredients() async {
    var response = await apiServices.getAllIngredients();
    return response;
  }
}
