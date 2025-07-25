import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal_details.dart';
import 'package:food_recipe_app/features/home/data/repo/get_meal_detail_by_id_repo.dart';
part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  MealDetailCubit(this.repo) : super(MealDetailInitial());

  final GetMealDetailByIdRepo repo;

  Future<void> getMealDetailById(String id) async {
    emit(MealDetailLoading());
    try {
      final mealDetail = await repo.getMealDetailById(id);
      emit(MealDetailSuccess(mealDetail));
    } catch (e) {
      emit(MealDetailFailure(e.toString()));
    }
  }
}
