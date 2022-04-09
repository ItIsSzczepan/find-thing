part of 'permission_cubit.dart';

@freezed
class PermissionCubitState with _$PermissionCubitState {
  const factory PermissionCubitState.initial() = Initial;
  const factory PermissionCubitState.data({required Map<Permissions, PermissionStatus> permissions}) = Data;
  const factory PermissionCubitState.failure({required Failure failure}) = FailureState;
}
