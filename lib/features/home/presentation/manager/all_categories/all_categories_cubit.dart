import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/models/categories/category_list.dart';
import 'package:food_recipe_app/features/home/data/repo/categories_repo.dart';
part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.categoriesRepo) : super(AllCategoriesInitial());
  final CategoriesRepo categoriesRepo;
  void getAllCategories() {
    categoriesRepo.getAllCategories().then((categoriesList) {
      if (!isClosed) {
        emit(GetAllCategories(allCategoriesList: categoriesList));
      }
    });
  }
}
