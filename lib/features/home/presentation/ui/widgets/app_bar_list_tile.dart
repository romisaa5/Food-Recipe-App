import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';

class AppBarListTile extends StatelessWidget {
  const AppBarListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Hello Jega', style: TextAppTheme.textStyle20),
      subtitle: Text(
        'What are you cooking today?',
        style: TextAppTheme.textStyle12.copyWith(color: Colors.black54),
      ),
      trailing: CircleAvatar(
        backgroundColor: AppColors.lightOrangeColor,
        radius: 24.r,
        child: Icon(Icons.person, size: 24.0.sp, color: Colors.white),
      ),
    );
  }
}
