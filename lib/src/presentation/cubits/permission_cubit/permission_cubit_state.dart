part of 'permission_cubit.dart';

@freezed
class PermissionCubitState with _$PermissionCubitState {
  const factory PermissionCubitState.initial() = PermissionInitial;
  const factory PermissionCubitState.data({required Map<Permissions, PermissionStatus> permissions}) = PermissionData;
  const factory PermissionCubitState.failure({required Failure failure}) = PermissionFailure;
}
