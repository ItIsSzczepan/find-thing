import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/use_cases/save_area_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../models.dart';
import 'save_area_use_case_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main() {
  late SaveAreaUseCase useCase;
  late MockDatabaseRepository repository;

  setUp(() {
    repository = MockDatabaseRepository();
    useCase = SaveAreaUseCase(repository);
    reset(repository);
  });

  test("useCase should save area and return id", () async {
    when(repository.saveArea(any)).thenAnswer((realInvocation) async => 12);
    Area testArea = TestModels().exampleArea;
    testArea.place.target = TestModels().examplePlace;

    final result = await useCase(params: testArea);

    expect(result, const Right(12));
    verify(repository.saveArea(any)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test("useCase should save area without id and return saved id", () async {
    when(repository.saveArea(any)).thenAnswer((realInvocation) async => 13);
    Area testArea = TestModels().exampleArea;
    testArea.place.target = TestModels().examplePlace;
    testArea.id = 0;

    final result = await useCase(params: testArea);

    expect(result, const Right(13));
    verify(repository.saveArea(any)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test("useCase should return failure when area has not place attached",
      () async {
    when(repository.saveArea(any)).thenAnswer((realInvocation) async => 13);
    Area testArea = TestModels().exampleArea;
    testArea.id = 0;

    final result = await useCase(params: testArea);

    expect(result, isA<Left>());
    verifyZeroInteractions(repository);
  });

  test("useCase should return failure on error", ()async{
    when(repository.saveArea(any)).thenThrow(Exception("test"));
    Area testArea = TestModels().exampleArea;
    testArea.place.target = TestModels().examplePlace;

    final result = await useCase(params: testArea);

    expect(result, isA<Left>());
    verify(repository.saveArea(any)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
