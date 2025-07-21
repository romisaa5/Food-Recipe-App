import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/app_bar_list_tile.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_text_form_field_search.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/filters_food_recipe.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/new_recipe_section.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              5.ph,
              AppBarListTile(),
              CustomTextFormFieldSearch(readOnly: true),
              FiltersFoodRecipe(),
              NewRecipeSection(),
            ],
          ),
        ),
      ),
    );
  }
}
