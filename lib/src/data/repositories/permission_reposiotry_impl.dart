import 'package:find_thing/src/data/data_sources/permission_service.dart';
import 'package:find_thing/src/domain/repositories/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRepositoryImpl extends PermissionRepository{
  final PermissionsService _permissionsService;

  PermissionRepositoryImpl(this._permissionsService);

  @override
  Future<PermissionStatus> check(Permission permission) async {
    return await _permissionsService.request(permission);
  }
}