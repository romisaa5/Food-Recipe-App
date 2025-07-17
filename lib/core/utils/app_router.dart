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
  static final router = GoRouter(
    initialLocation: welcomeView,
    routes: [
      GoRoute(path: welcomeView, builder: (context, state) => OnboardView()),
    ],
  );
}
