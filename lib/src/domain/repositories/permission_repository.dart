import 'package:permission_handler/permission_handler.dart';

abstract class PermissionRepository{
  Future<PermissionStatus> check(Permission permission);
  Future<bool> openSettings();
}