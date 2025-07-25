import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/filter_meal_by_ingrediant/filter_meal_by_ingredient_list.dart';


class GetMealByIngradientsRepo {
  final ApiServices apiServices;
  GetMealByIngradientsRepo({required this.apiServices});
    Future<FilterMealByIngredientList> getMealByIngradients(String ingredients) async {
    var response = await apiServices.getMealsByIngredients(ingredients);
    return response;
  }
}
