import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:food_recipe_app/features/auth/login/presentation/views/forget_password.dart';
import 'package:food_recipe_app/features/auth/login/presentation/views/login_view.dart';
import 'package:food_recipe_app/features/auth/register/presentation/manager/terms_cubit.dart';
import 'package:food_recipe_app/features/auth/register/presentation/views/register_view.dart';
import 'package:food_recipe_app/features/home/presentation/ui/views/meal_details_view.dart';
import 'package:food_recipe_app/features/home/presentation/ui/views/search_view.dart';
import 'package:food_recipe_app/features/navBar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:food_recipe_app/features/navBar/presentation/views/nav_bar.dart';
import 'package:food_recipe_app/features/onboard/presentation/views/onboard_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final welcomeView = '/welcomeview';
  static final loginView = '/loginview';
  static final registerView = '/registerview';
  static final emailVerifiedView = '/emailverifiedview';
  static final forgetPassword = '/forgetpassword';
  static final navBar = '/navBar';
  static final detailsview = '/detailsview';
  static final searchView = '/searchview';
  static GoRouter getRouter(bool isOnBoarded) {
    return GoRouter(
      initialLocation: navBar,
      routes: [
        GoRoute(
          path: welcomeView,
          builder: (context, state) => const OnboardView(),
        ),
        GoRoute(path: loginView, builder: (context, state) => LoginView()),
        GoRoute(
          path: registerView,
          builder:
              (context, state) => BlocProvider(
                create: (context) => TermsCubit(),
                child: RegisterView(),
              ),
        ),
        GoRoute(
          path: navBar,
          builder:
              (context, state) => BlocProvider(
                create: (context) => NavbarCubit(),
                child: NavBar(),
              ),
        ),
        GoRoute(path: searchView, builder: (context, state) => SearchView()),
        GoRoute(
          path: forgetPassword,
          builder: (context, state) => ForgetPassword(),
        ),
        GoRoute(
          path: detailsview,
          builder: (context, state) {
            final mealId = state.extra as String;
            return MealDetailsView(mealId: mealId);
          },
        ),
      ],
    );
  }
}
