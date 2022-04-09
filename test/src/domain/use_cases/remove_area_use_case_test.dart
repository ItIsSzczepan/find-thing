import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/use_cases/remove_area_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_area_use_case_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main(){
  late RemoveAreaUseCase useCase;
  late MockDatabaseRepository mockRepository;

  setUp((){
    mockRepository = MockDatabaseRepository();
    useCase = RemoveAreaUseCase(mockRepository);
    reset(mockRepository);
  });

  test("useCase should return true if area was removed", ()async{
    when(mockRepository.removeArea(any)).thenAnswer((realInvocation) async => true);

    final result = await useCase(params: 0);

    expect(result, const Right(true));
    verify(mockRepository.removeArea(any)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test("useCase should return false if area wasn't removed", ()async{
    when(mockRepository.removeArea(any)).thenAnswer((realInvocation) async => false);

    final result = await useCase(params: 0);

    expect(result, const Right(false));
    verify(mockRepository.removeArea(any)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test("useCase should return failure on error", ()async{
    when(mockRepository.removeArea(any)).thenThrow(Exception("test"));

    final result = await useCase(params: 0);

    expect(result, isA<Left>());
    verify(mockRepository.removeArea(any)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}