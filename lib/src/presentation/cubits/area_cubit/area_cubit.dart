import 'package:bloc/bloc.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/use_cases/remove_area_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_area_use_case.dart';

class AreaCubit extends Cubit<Area> {
  Area _area;
  final SaveAreaUseCase _saveAreaUseCase;
  final RemoveAreaUseCase _removeAreaUseCase;

  AreaCubit(this._area, this._saveAreaUseCase, this._removeAreaUseCase)
      : super(_area);

  move({double? x, double? y}) {
    if (x == null && y == null) {
      return addError(Failure("AreaCubit.move(): at least one argument must be set."));
    }
    Area modifyArea = _area;

    modifyArea.x = x ?? _area.x;
    modifyArea.y = y ?? _area.y;

    _edit(modifyArea);
  }

  size({double? width, double? height}) {
    if (width == null && height == null) {
      return addError(Failure("AreaCubit.size(): at least one argument must be set."));
    }
    Area modifyArea = _area;

    modifyArea.width = width ?? _area.width;
    modifyArea.height = height ?? _area.height;

    _edit(modifyArea);
  }

  radius(double radius) {
    Area modifyArea = _area;
    modifyArea.width = radius;
    _edit(modifyArea);
  }

  content(String content) {
    Area modifyArea = _area;
    modifyArea.content = content;
    _edit(modifyArea);
  }

  remove() async {
    final result = await _removeAreaUseCase(params: _area.id);
    result.fold((l) => addError(l), (r) => null);
  }

  _edit(Area newArea) async {
    final result = await _saveAreaUseCase(params: newArea);
    result.fold((l) => addError(l), (r) {
      _area = newArea;
      emit(newArea);
    });
  }
}
