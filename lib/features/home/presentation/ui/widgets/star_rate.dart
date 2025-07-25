import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';


class StarRate extends StatefulWidget {
  const StarRate({super.key});

  @override
  State<StarRate> createState() => _StarRateState();
}

class _StarRateState extends State<StarRate> {
  late double value;
  @override
  void initState() {
    super.initState();
    value = 4;
  }

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: (v) {
        setState(() {
          value = v;
        });
      },
      starBuilder:
          (index, color) => Icon(Icons.star, color: color, size: 18.sp),
      starCount: 5,
      starSize: 18.sp,
      valueLabelRadius: 10,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: true,
      valueLabelVisibility: false,
      animationDuration: Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: AppColors.greyColor,
      starColor: AppColors.orangeColor,
    );
  }
}
