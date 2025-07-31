import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/widgets/custom_button.dart';
import 'package:food_recipe_app/features/home/data/models/categories/category.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/meal.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_areas/all_areas_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_categories/all_categories_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_state.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_loader.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/filter_option_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<Category> categories = [];
  List<MealByArea> areas = [];

  @override
  void initState() {
    super.initState();
    context.read<AllCategoriesCubit>().getAllCategories();
    context.read<AllAreasCubit>().getAllAreas();
  }

@override
Widget build(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * .7,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          20.ph,
          Text(
            "Cuisine",
            style: TextAppTheme.textStyle14.copyWith(color: Colors.black),
          ),
          10.ph,
          BlocBuilder<AllAreasCubit, AllAreasState>(
            builder: (context, areaState) {
              if (areaState is GetAllAreas) {
                areas = areaState.allAreasList.meals ?? [];
                return BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, filterState) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: areas.map((area) {
                        final name = area.strArea ?? 'Unknown';
                        return FilterOptionButton(
                          label: name,
                          isSelected: filterState.selectedCuisine == name,
                          onTap: () =>
                              context.read<FilterCubit>().selectCuisine(name),
                        );
                      }).toList(),
                    );
                  },
                );
              } else {
                return const CustomLoader();
              }
            },
          ),
          20.ph,
          Text(
            "Category",
            style: TextAppTheme.textStyle14.copyWith(color: Colors.black),
          ),
          10.ph,
          BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
            builder: (context, catState) {
              if (catState is GetAllCategories) {
                categories = catState.allCategoriesList.categories ?? [];
                return BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, filterState) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: categories.map((cat) {
                        final name = cat.strCategory ?? 'Unknown';
                        return FilterOptionButton(
                          label: name,
                          isSelected: filterState.selectedCategory == name,
                          onTap: () =>
                              context.read<FilterCubit>().selectCategory(name),
                        );
                      }).toList(),
                    );
                  },
                );
              } else {
                return const CustomLoader();
              }
            },
          ),
          30.ph,
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
        ],
      ),
    ),
  );
}

      
    
  }
