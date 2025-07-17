import 'package:flutter/material.dart';
import 'package:food_recipe_app/features/onboard/presentation/widgets/onboard_body.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/onboard.png', fit: BoxFit.cover),
          ),
          OnboardBody(),
        ],
      ),
    );
  }
}
