import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/repo/get_all_ingredients.dart';
import 'package:food_recipe_app/features/home/presentation/manager/all_ingredients/all_ingredients_cubit.dart';


class AllIngredientsCubit extends Cubit<AllIngredientsState> {
  final GetAllIngredientsRepo getAllIngredientsUseCase;

  AllIngredientsCubit({required this.getAllIngredientsUseCase})
    : super(AllIngredientsInitial());

  Future<void> fetchAllIngredients() async {
    emit(AllIngredientsLoading());
    try {
      final ingredient = await getAllIngredientsUseCase.getAllIngredients();
      emit(AllIngredientsSuccess(ingredient: ingredient));
    } catch (e) {
      emit(AllIngredientsError(e.toString()));
    }
  }
}
