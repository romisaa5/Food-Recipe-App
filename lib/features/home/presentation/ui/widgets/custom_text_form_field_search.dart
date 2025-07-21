import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/utils/app_router.dart';
import 'package:food_recipe_app/core/widgets/custom_text_form_field.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/filter_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch({super.key, required this.readOnly});
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (readOnly) {
                FocusScope.of(context).unfocus();
                GoRouter.of(context).push(AppRouter.searchView);
              }
            },
            child: AbsorbPointer(
              absorbing: readOnly,
              child: AppTextFormField(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                readOnly: readOnly,
                hintText: 'Search recipe',
                prefixIcon: Icon(Icons.search_rounded, size: 24.sp),
              ),
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.tune, size: 24.sp, color: Colors.white),
            onPressed: () async {
              /* final result =*/
              await showModalBottomSheet<FilterState>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder:
                    (_) => BlocProvider.value(
                      value: context.read<FilterCubit>(),
                      child: const FilterBottomSheet(),
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
