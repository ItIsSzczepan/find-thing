import 'package:bloc/bloc.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/use_cases/edit_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/get_places_use_case.dart';
import 'package:find_thing/src/domain/use_cases/remove_place_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_state.dart';

part 'place_cubit.freezed.dart';

class PlaceCubit extends Cubit<PlaceCubitState> {
  final GetPlacesUseCase _getPlacesUseCase;
  final EditPlaceUseCase _editPlaceUseCase;
  final RemovePlaceUseCase _removePlaceUseCase;

  PlaceCubit(
      this._getPlacesUseCase, this._editPlaceUseCase, this._removePlaceUseCase)
      : super(const PlaceCubitState.initial());

  getPlaces() async {
    final result = await _getPlacesUseCase();
    result.fold((l) => _emitError(l), (r) {
      emit(PlaceCubitState.data(stream: r));
    });
  }

  edit(Place place) {
    _editPlaceUseCase(params: place).then((value) => value.fold(
        (l) => _emitError(l),
        (r) => r ? null : _emitError(Failure("Can't edit Place"))));
  }

  remove(int id) {
    _removePlaceUseCase(params: id).then((value) => value.fold(
        (l) => _emitError(l),
        (r) => r ? null : _emitError(Failure("Can't remove Place"))));
  }

  _emitError(Failure failure) {
    addError(failure);
    //emit(PlaceCubitState.failure(failure: failure));
  }
}
