import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal_details.dart';

class GetMealDetailByIdRepo {
  final ApiServices apiServices;
  GetMealDetailByIdRepo({required this.apiServices});
  Future<MealDetails> getMealDetailById(String id) async {
    var response = await apiServices.getMealDetailById(id);
    return response;
  }
}
