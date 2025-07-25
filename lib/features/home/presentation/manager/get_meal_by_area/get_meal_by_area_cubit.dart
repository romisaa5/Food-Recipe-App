import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/models/filter_by_area/filter_by_area.dart';

import 'package:food_recipe_app/features/home/data/repo/get_meals_by_area_repo.dart';
part 'get_meal_by_area_state.dart';

class GetMealByAreaCubit extends Cubit<GetMealByAreaState> {
  GetMealByAreaCubit(this.getMealsByAreaRepo) : super(GetMealByAreaInitial());
  final GetMealsByAreaRepo getMealsByAreaRepo;

  Future<void> getMealsByArea(String area) async {
    emit(GetMealByAreaLoading());
    try {
      final meals = await getMealsByAreaRepo.getMealsByArea(area);
      emit(GetMealByAreaSuccess(meals));
    } catch (e) {
      emit(GetMealByAreaFailure(e.toString()));
    }
  }
}
