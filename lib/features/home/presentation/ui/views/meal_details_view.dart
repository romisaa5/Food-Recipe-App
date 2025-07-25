import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/utils/injection.dart';
import 'package:food_recipe_app/features/home/presentation/manager/meal_detail/meal_detail_cubit.dart';
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
              return Column(
                children: [
                  if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty)
                    MealCardPreview(imageUrl: meal.strMealThumb ?? ''),
                ],
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
