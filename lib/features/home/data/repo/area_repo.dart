import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/food_area.dart';

class AreaRepo {
  final ApiServices apiServices;
  AreaRepo({required this.apiServices});
  Future<FoodArea> getAllAreas() async {
    var response = await apiServices.getAllAreas();
    return response;
  }
}
