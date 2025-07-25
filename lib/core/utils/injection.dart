import 'package:dio/dio.dart';
import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/repo/area_repo.dart';
import 'package:food_recipe_app/features/home/data/repo/categories_repo.dart';
import 'package:food_recipe_app/features/home/data/repo/get_all_ingredients.dart';
import 'package:food_recipe_app/features/home/data/repo/get_meal_by_ingradients_repo.dart';
import 'package:food_recipe_app/features/home/data/repo/get_meal_detail_by_id_repo.dart';
import 'package:food_recipe_app/features/home/data/repo/get_meals_by_area_repo.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_categories/all_categories_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_ingredients/all_ingredients_state.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_area/get_meal_by_area_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_ingredients/get_meal_by_ingredients_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/meal_detail/meal_detail_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGitIt() {
  getIt.registerLazySingleton<AllAreasCubit>(() => AllAreasCubit(getIt()));
  getIt.registerLazySingleton<AreaRepo>(() => AreaRepo(apiServices: getIt()));
  getIt.registerLazySingleton<AllIngredientsCubit>(
    () => AllIngredientsCubit(getAllIngredientsUseCase: getIt()),
  );
  getIt.registerLazySingleton<GetAllIngredientsRepo>(
    () => GetAllIngredientsRepo(apiServices: getIt()),
  );
  getIt.registerFactory<AllCategoriesCubit>(() => AllCategoriesCubit(getIt()));
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(apiServices: getIt()),
  );
  getIt.registerLazySingleton<GetMealByAreaCubit>(
    () => GetMealByAreaCubit(getIt()),
  );
  getIt.registerLazySingleton<GetMealsByAreaRepo>(
    () => GetMealsByAreaRepo(apiServices: getIt()),
  );
  getIt.registerLazySingleton<GetMealByIngredientsCubit>(
    () => GetMealByIngredientsCubit(getIt()),
  );
  getIt.registerLazySingleton<GetMealByIngradientsRepo>(
    () => GetMealByIngradientsRepo(apiServices: getIt()),
  );
  getIt.registerLazySingleton<GetMealDetailByIdRepo>(
    () => GetMealDetailByIdRepo(apiServices: getIt()),
  );
  getIt.registerFactory<MealDetailCubit>(() => MealDetailCubit(getIt()));

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetupDio()),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = Duration(seconds: 10)
    ..options.receiveTimeout = Duration(seconds: 15);
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ),
  );
  return dio;
}
