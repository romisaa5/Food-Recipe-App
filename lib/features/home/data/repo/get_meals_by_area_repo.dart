import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/models/filter_by_area/filter_by_area.dart';

class GetMealsByAreaRepo {
  final ApiServices apiServices;
  GetMealsByAreaRepo({required this.apiServices});
  Future<FilterByArea> getMealsByArea(String category) async {
    var response = await apiServices.getMealsByArea(category);
    return response;
  }
}
