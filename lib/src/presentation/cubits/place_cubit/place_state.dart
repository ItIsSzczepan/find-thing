part of 'place_cubit.dart';

@freezed
class PlaceCubitState with _$PlaceCubitState{
  const factory PlaceCubitState.initial() = PlaceInitial;
  const factory PlaceCubitState.data({required Stream stream}) = PlaceData;
  const factory PlaceCubitState.failure({required Failure failure}) = PlaceFailure;
}