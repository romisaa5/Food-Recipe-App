class FilterState {
  final String selectedCategory;
  final String selectedCuisine;

  FilterState({
    this.selectedCuisine = 'Egyptian',
    this.selectedCategory = 'Beef',
  });

  FilterState copyWith({
    String? selectedCuisine,
    String? selectedCategories,
  }) {
    return FilterState(
      selectedCuisine: selectedCuisine ?? this.selectedCuisine,
      selectedCategory: selectedCategories ?? this.selectedCategory,
    );
  }
}
