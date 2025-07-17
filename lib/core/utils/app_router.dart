import 'package:food_recipe_app/features/auth/login/presentation/views/login_view.dart';
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
  static GoRouter getRouter(bool isOnBoarded) {
    return GoRouter(
      initialLocation: isOnBoarded ? loginView : welcomeView,
      routes: [
        GoRoute(
          path: welcomeView,
          builder: (context, state) => const OnboardView(),
        ),
        GoRoute(
          path: loginView,
          builder: (context, state) => const LoginView(),
        ),
      ],
    );
  }
}
