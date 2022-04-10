part of 'image_cubit.dart';

@freezed
class ImageCubitState with _$ImageCubitState{
  const factory ImageCubitState.initial() = ImageInitial;
  const factory ImageCubitState.empty() = ImageEmpty;
  const factory ImageCubitState.picked(XFile file) = ImagePicked;
  const factory ImageCubitState.failure({required Failure failure}) = ImageFailure;
}