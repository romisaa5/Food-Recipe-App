part of 'all_categories_cubit.dart';

@immutable
sealed class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

class GetAllCategories extends AllCategoriesState {
  final CategoryList allCategoriesList;

  GetAllCategories({required this.allCategoriesList});
}
