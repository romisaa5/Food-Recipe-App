import 'package:dio/dio.dart';
import 'package:food_recipe_app/core/utils/api_services.dart';
import 'package:food_recipe_app/features/home/data/repo/area_repo.dart';
import 'package:food_recipe_app/features/home/data/repo/categories_repo.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_categories/all_categories_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGitIt() {
  getIt.registerLazySingleton<AllAreasCubit>(() => AllAreasCubit(getIt()));
  getIt.registerLazySingleton<AreaRepo>(() => AreaRepo(apiServices: getIt()));
  getIt.registerLazySingleton<AllCategoriesCubit>(
    () => AllCategoriesCubit(getIt()),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(apiServices: getIt()),
  );
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(createAndSetupDio()),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = Duration(seconds: 1)
    ..options.receiveTimeout = Duration(seconds: 1);
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
