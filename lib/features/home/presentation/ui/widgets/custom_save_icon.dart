import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/services/saved_meals_service.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';


class CustomSaveIcon extends StatefulWidget {
  final String mealId;
  final Map<String, dynamic> mealData;

  const CustomSaveIcon({
    super.key,
    required this.mealId,
    required this.mealData,
  });

  @override
  State<CustomSaveIcon> createState() => _CustomSaveIconState();
}

class _CustomSaveIconState extends State<CustomSaveIcon> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    checkSavedStatus();
  }

  Future<void> checkSavedStatus() async {
    final saved = await SavedMealsService.isMealSaved(widget.mealId);
    setState(() {
      isSaved = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await SavedMealsService.toggleSaveMeal(widget.mealId, widget.mealData);
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
