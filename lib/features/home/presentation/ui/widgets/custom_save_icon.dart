import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';

class CustomSaveIcon extends StatefulWidget {
  const CustomSaveIcon({super.key});

  @override
  State<CustomSaveIcon> createState() => _CustomSaveIconState();
}

class _CustomSaveIconState extends State<CustomSaveIcon> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      child: CircleAvatar(
        radius: 18,
        backgroundColor: isSaved ? AppColors.greyColor : Colors.white,
        child: Icon(
          isSaved ? Icons.bookmark : Icons.bookmark_border,
          size: 20.sp,
          color: isSaved ? AppColors.primaryColorLight : Colors.black,
        ),
      ),
    );
  }
}
