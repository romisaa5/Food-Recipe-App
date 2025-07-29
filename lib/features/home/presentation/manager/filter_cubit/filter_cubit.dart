import 'package:flutter_bloc/flutter_bloc.dart';
part  'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void selectTime(String time) {
    emit(state.copyWith(selectedTime: time));
  }

  void selectRate(String rate) {
    emit(state.copyWith(selectedRate: rate));
  }

  void toggleCategory(String category) {
    final updated = Set<String>.from(state.selectedCategories);
    if (updated.contains(category)) {
      updated.remove(category);
    } else {
      updated.add(category);
    }
    emit(state.copyWith(selectedCategories: updated));
  }
}
