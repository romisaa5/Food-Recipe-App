import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/utils/injection.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_categories/all_categories_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_ingredients/all_ingredients_state.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_area/get_meal_by_area_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/get_meal_by_ingredients/get_meal_by_ingredients_cubit.dart';

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key, required this.isOnBoarded});
  final bool isOnBoarded;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AllAreasCubit>()),
            BlocProvider(create: (context) => getIt<GetMealByAreaCubit>()),
            BlocProvider(create: (context) => getIt<AllIngredientsCubit>()),
            BlocProvider(
              create: (context) => getIt<GetMealByIngredientsCubit>(),
            ),
            BlocProvider(create: (context) => getIt<AllCategoriesCubit>()),
            BlocProvider(create: (context) => FilterCubit()),
          ],
          child: MaterialApp.router(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            routerConfig: AppRouter.getRouter(isOnBoarded),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
