import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/presentation/manager/filter_cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategories: category));
  }

  void selectCuisine(String cuisine) {
    emit(state.copyWith(selectedCuisine: cuisine));
  }
}
