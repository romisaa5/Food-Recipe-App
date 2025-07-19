part of 'filter_cubit.dart';

class FilterState {
  final String selectedTime;
  final String selectedRate;
  final Set<String> selectedCategories;

  FilterState({
    this.selectedTime = 'All',
    this.selectedRate = '4',
    this.selectedCategories = const {'All'},
  });

  FilterState copyWith({
    String? selectedTime,
    String? selectedRate,
    Set<String>? selectedCategories,
  }) {
    return FilterState(
      selectedTime: selectedTime ?? this.selectedTime,
      selectedRate: selectedRate ?? this.selectedRate,
      selectedCategories: selectedCategories ?? this.selectedCategories,
    );
  }
}
