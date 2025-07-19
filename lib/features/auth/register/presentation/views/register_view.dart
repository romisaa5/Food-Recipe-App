import 'package:flutter/material.dart';
import 'package:food_recipe_app/features/auth/register/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(padding: EdgeInsets.all(24.0), child: RegisterForm()),
    );
  }
}
