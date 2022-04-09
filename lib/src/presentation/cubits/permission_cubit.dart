import 'package:bloc/bloc.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_cubit_state.dart';

part 'permission_cubit.freezed.dart';

class PermissionCubit extends Cubit<PermissionCubitState> {
  final CheckAndAskPermissionUseCase useCase;

  PermissionCubit(this.useCase) : super(const PermissionCubitState.initial());

  Future<void> checkFile() async {
    final result = await useCase(params: Permissions.file);
    result.fold(
        (l) => emit(PermissionCubitState.failure(failure: l)),
        (r) => _editData(Permissions.file, r));
  }

  _editData(Permissions name, PermissionStatus newValue){
    if(state is Data){
      Map<Permissions, PermissionStatus> stateMap = (state as Data).permissions;
      stateMap[name] = newValue;
      (state as Data).copyWith(permissions: stateMap);
    }else{
      emit(PermissionCubitState.data(permissions: {name: newValue}));
    }
  }
}
