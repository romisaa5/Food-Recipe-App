import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/core/utils/injection.dart';
import 'package:food_recipe_app/features/home/presentation/manager/meal_detail/meal_detail_cubit.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_save_icon.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/detail_tab_bar.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/meal_card_preview.dart.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/more_options_menu.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.mealId});
  final String mealId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MealDetailCubit>()..getMealDetailById(mealId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [MoreOptionsMenu()],
        ),
        body: BlocBuilder<MealDetailCubit, MealDetailState>(
          builder: (context, state) {
            if (state is MealDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealDetailSuccess) {
              final meal =
                  state.recipe.meals?.isNotEmpty == true
                      ? state.recipe.meals!.first
                      : null;
              if (meal == null) {
                return const Center(child: Text("No meal details found."));
              }
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (meal.strYoutube != null &&
                          meal.strYoutube!.isNotEmpty)
                        MealCardPreview(imageUrl: meal.strMealThumb ?? ''),
                      Text(
                        meal.strMeal ?? 'No Name',
                        style: TextAppTheme.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Taste the flavors of ${meal.strArea} cuisine!",
                          style: TextAppTheme.textStyle14.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          'Category : ${meal.strCategory} ',
                          style: TextAppTheme.textStyle12,
                        ),
                        trailing: CustomSaveIcon(),
                      ),

                      DetailTabsSection(recipe: meal),
                    ],
                  ),
                ),
              );
            } else if (state is MealDetailFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
