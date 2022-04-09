import 'package:find_thing/src/data/data_sources/permission_service.dart';
import 'package:find_thing/src/data/repositories/permission_reposiotry_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_repository_impl_test.mocks.dart';

@GenerateMocks([PermissionsService])
void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  late PermissionRepositoryImpl repositoryImpl;
  late MockPermissionsService mockPermission;

  setUp((){
    mockPermission = MockPermissionsService();
    repositoryImpl = PermissionRepositoryImpl(mockPermission);
    reset(mockPermission);
  });

  test("repository should ask for permission", ()async{
    when(mockPermission.request(any)).thenAnswer((realInvocation) async => PermissionStatus.granted);

    final result = await repositoryImpl.check(Permission.storage);

    expect(result, PermissionStatus.granted);
    verify(mockPermission.request(any));
  });

  test("repository should ask for permission", ()async{
    when(mockPermission.request(any)).thenAnswer((realInvocation) async => PermissionStatus.denied);

    final result = await repositoryImpl.check(Permission.storage);

    expect(result, PermissionStatus.denied);
    verify(mockPermission.request(any));
  });

  test("repository should ask for permission", ()async{
    when(mockPermission.request(any)).thenThrow(Exception());

    expect(() => repositoryImpl.check(Permission.storage), throwsA(isA<Exception>()));
  });
}