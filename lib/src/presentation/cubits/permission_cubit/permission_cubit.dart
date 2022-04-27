// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:bloc/bloc.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/domain/use_cases/open_settings_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_cubit_state.dart';

part 'permission_cubit.freezed.dart';

class PermissionCubit extends Cubit<PermissionCubitState> {
  final CheckAndAskPermissionUseCase checkUseCase;
  final OpenSettingsUseCase openSettingsUseCase;

  PermissionCubit(this.checkUseCase, this.openSettingsUseCase)
      : super(const PermissionCubitState.initial());

  Future<void> checkFile() async {
    final result = await checkUseCase(params: Permissions.file);
    result.fold((l) => emit(PermissionCubitState.failure(failure: l)),
        (r) => _editData(Permissions.file, r));
  }

  Future<void> openSettings() async {
    await openSettingsUseCase()
      ..fold(
          (l) => emit(PermissionCubitState.failure(failure: l)), (r) => null);
  }

  _editData(Permissions name, PermissionStatus newValue) {
    if (state is PermissionData) {
      Map<Permissions, PermissionStatus> stateMap =
          (state as PermissionData).permissions;
      stateMap[name] = newValue;
      (state as PermissionData).copyWith(permissions: stateMap);
      emit(const PermissionCubitState.initial());
      emit(state);
    } else {
      emit(PermissionCubitState.data(permissions: {name: newValue}));
    }
  }
}
