import 'package:dio/dio.dart';
import 'package:food_recipe_app/features/home/data/models/categories/category_list.dart';
import 'package:food_recipe_app/features/home/data/models/filter_by_area/filter_by_area.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/food_area.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal_details.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
  @GET('list.php?a=list')
  Future<FoodArea> getAllAreas();

  @GET('categories.php')
  Future<CategoryList> getAllCategories();
  @GET('filter.php')
  Future<FilterByArea> getMealsByArea(@Query('a') String area);

  @GET('lookup.php')
  Future<MealDetails> getMealDetailById(@Query('i') String id);
}
