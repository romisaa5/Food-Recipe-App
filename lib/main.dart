import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/features/auth/register/presentation/manager/terms_cubit.dart';
import 'package:food_recipe_app/features/navBar/presentation/manager/cubit/navbar_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isOnBoarded = prefs.getBool('isOnBoarded') ?? false;
  runApp(FoodRecipeApp(isOnBoarded: isOnBoarded));
}

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
            BlocProvider(create: (context) => TermsCubit()),
            BlocProvider(create: (context) => NavbarCubit()),
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
