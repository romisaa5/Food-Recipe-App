import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Center(
        child: Column(
          spacing: 5.h,
          children: [
            Image.asset('assets/images/no_food.png', height: 150.h),
            Text('No meals found', style: TextAppTheme.textStyle14),
          ],
        ),
      ),
    );
  }
}
