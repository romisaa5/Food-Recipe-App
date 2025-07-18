import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class CustomOr extends StatelessWidget {
  const CustomOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: .6)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Or Sign in With', style: TextAppTheme.textStyle12),
        ),
        const Expanded(child: Divider(color: Colors.grey, thickness: .6)),
      ],
    );
  }
}
