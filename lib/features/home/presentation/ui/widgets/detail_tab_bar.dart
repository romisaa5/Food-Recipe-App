import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';

class DetailTabsSection extends StatefulWidget {
  final Meal recipe;

  const DetailTabsSection({super.key, required this.recipe});

  @override
  State<DetailTabsSection> createState() => _DetailTabsSectionState();
}

class _DetailTabsSectionState extends State<DetailTabsSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          controller: _tabController,
          isScrollable: false,
          indicator: const BoxDecoration(),
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          tabs: List.generate(2, (index) {
            final isSelected = _tabController.index == index;
            final labels = [" Ingredients", " Instructions"];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                labels[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildIngredientsTab(recipe),
              _buildInstructionsTab(recipe),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsTab(Meal recipe) {
    final ingredients = <String>[];

    for (int i = 1; i <= 20; i++) {
      final ingredient = recipe.toJson()["strIngredient$i"];
      final measure = recipe.toJson()["strMeasure$i"];
      if (ingredient != null &&
          ingredient.toString().isNotEmpty &&
          ingredient.toString() != "") {
        ingredients.add('$ingredient - ${measure ?? ""}');
      }
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index].split(" - ")[0];
        final measure = ingredients[index].split(" - ")[1];

        return Card(
          elevation: 2,
          color: AppColors.greyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(
              Icons.check_circle_outline,
              color: AppColors.primaryColor,
            ),
            title: Text(
              ingredient,
              style: TextAppTheme.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              measure,
              style: TextAppTheme.textStyle14.copyWith(color: Colors.grey[600]),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInstructionsTab(Meal recipe) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        recipe.strInstructions ?? "No instructions available",
        style: TextAppTheme.textStyle14.copyWith(color: Colors.black),
      ),
    );
  }
}
