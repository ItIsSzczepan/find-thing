import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/params.dart';
import 'package:find_thing/src/domain/use_cases/retrieve_lost_image_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/user_pick_image_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageCubitState> {
  final UserPickImageUseCase _userPickImageUseCase;
  final RetrieveLostImageUseCase _retrieveLostImageUseCase;
  final SavePlaceUseCase _savePlaceUseCase;

  ImageCubit(this._userPickImageUseCase, this._retrieveLostImageUseCase,
      this._savePlaceUseCase)
      : super(const ImageCubitState.initial());

  pickImage(ImageSource source) {
    _userPickImageUseCase(params: source)
        .then((value) => value.fold((l) => _emitError(l), (r) {
              if (r != null) {
                emit(ImageCubitState.picked(r));
              } else {
                emit(const ImageCubitState.empty());
              }
            }));
  }

  retrieveImage() {
    _retrieveLostImageUseCase()
        .then((value) => value.fold((l) => _emitError(l), (r) {
              if (r != null) emit(ImageCubitState.picked(r));
            }));
  }

  Future<bool> savePlace({required String name, required Image image}) async {
    bool saved = false;
    final result = await _savePlaceUseCase(
        params: SaveImageParams(image: image, name: name));
    result.fold((l) => _emitError(l), (r) {
      if (r) {
        saved = true;
        emit(const ImageCubitState.empty());
      } else {
        emit(ImageCubitState.failure(failure: Failure("Can't save image")));
      }
    });

    return saved;
  }

  _emitError(Failure failure) {
    addError(failure);
    emit(ImageCubitState.failure(failure: failure));
  }
}
