import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:food_recipe_app/features/home/data/models/categories/category.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_categories/all_categories_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/filter_option_button.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/rate_option_button.dart';

class FilterBottomSheet extends StatefulWidget {
  FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<Category> categories = [];
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategories) {
          categories = (state).allCategoriesList.categories ?? [];
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Filter Search",
                      style: TextAppTheme.textStyle14.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    "Time",
                    style: TextAppTheme.textStyle14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                      return Wrap(
                        spacing: 10,
                        children: [
                          FilterOptionButton(
                            label: "All",
                            isSelected: state.selectedTime == "All",
                            onTap:
                                () => context.read<FilterCubit>().selectTime(
                                  "All",
                                ),
                          ),
                          FilterOptionButton(
                            label: "Newest",
                            isSelected: state.selectedTime == "Newest",
                            onTap:
                                () => context.read<FilterCubit>().selectTime(
                                  "Newest",
                                ),
                          ),
                          FilterOptionButton(
                            label: "Oldest",
                            isSelected: state.selectedTime == "Oldest",
                            onTap:
                                () => context.read<FilterCubit>().selectTime(
                                  "Oldest",
                                ),
                          ),
                          FilterOptionButton(
                            label: "Popularity",
                            isSelected: state.selectedTime == "Popularity",
                            onTap:
                                () => context.read<FilterCubit>().selectTime(
                                  "Popularity",
                                ),
                          ),
                        ],
                      );
                    },
                  ),

                  Text(
                    "Rate",
                    style: TextAppTheme.textStyle14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                      return Wrap(
                        spacing: 10,
                        children: List.generate(5, (index) {
                          final rate = (index + 1).toString();
                          return RateOptionButton(
                            label: rate,
                            isSelected: state.selectedRate == rate,
                            onTap:
                                () => context.read<FilterCubit>().selectRate(
                                  rate,
                                ),
                          );
                        }),
                      );
                    },
                  ),

                  Text(
                    "Category",
                    style: TextAppTheme.textStyle14.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            categories.map((cat) {
                              return FilterOptionButton(
                                label: cat.strCategory ?? 'No Name',
                                isSelected: state.selectedCategories.contains(
                                  cat,
                                ),
                                onTap:
                                    () => context
                                        .read<FilterCubit>()
                                        .toggleCategory(
                                          cat.strCategory ?? 'No Name',
                                        ),
                              );
                            }).toList(),
                      );
                    },
                  ),

                  10.ph,
                  Center(
                    child: CustomButton(
                      onTap: () {
                        final filterState = context.read<FilterCubit>().state;
                        Navigator.pop(context, filterState);
                      },
                      text: 'Filter',
                      color: AppColors.primaryColor,
                      width: 175.w,
                      hight: 40.h,
                    ),
                  ),
                  10.ph,
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
