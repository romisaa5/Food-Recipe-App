import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/custom_snackbar.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';

class RecipeLinkDialog extends StatelessWidget {
  const RecipeLinkDialog({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        height: 167.h,
        width: 310.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Recipe Link ', style: TextAppTheme.textStyle20),
              Text(
                'Copy recipe link and share your recipe link with  friends and family.',
                style: TextAppTheme.textStyle12,
              ),
              Container(
                height: 43.h,
                width: 280.w,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 170,
                        child: Text(
                          meal.strYoutube ?? '',
                          style: TextAppTheme.textStyle12.copyWith(
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Container(
                      height: 43.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(9.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: meal.strYoutube ?? ''),
                          );
                          showDoneSnackBar(
                            message: 'Link copied to clipboard!',
                            context: context,
                          );
                        },
                        child: Text(
                          'Copy Link',
                          style: TextAppTheme.textStyle12.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
