part of 'all_areas_cubit.dart';

@immutable
sealed class AllAreasState {}

final class AllAreasInitial extends AllAreasState {}

final class GetAllAreas extends AllAreasState {
  final FoodArea allAreasList;
  GetAllAreas({required this.allAreasList});
}
