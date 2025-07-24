import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/features/home/data/models/food_recipe_area/food_area.dart';
import 'package:food_recipe_app/features/home/data/repo/area_repo.dart';

part 'all_areas_state.dart';

class AllAreasCubit extends Cubit<AllAreasState> {
  AllAreasCubit(this.areaRepo) : super(AllAreasInitial());
  final AreaRepo areaRepo;
  void getAllAreas() {
    areaRepo.getAllAreas().then((areasList) {
      emit(GetAllAreas(allAreasList: areasList));
    });
  }
}
