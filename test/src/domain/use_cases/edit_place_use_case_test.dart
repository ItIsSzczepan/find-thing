
import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/use_cases/edit_place_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../models.dart';
import 'edit_place_use_case_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main(){
  late EditPlaceUseCase useCase;
  late MockDatabaseRepository databaseRepository;

  setUp((){
    databaseRepository = MockDatabaseRepository();
    useCase = EditPlaceUseCase(databaseRepository);
  });

  Place examplePlace = TestModels().examplePlace;

  test("use case should return true when object was edited", ()async{
    when(databaseRepository.savePlace(any)).thenAnswer((realInvocation) async  => examplePlace.id);
    examplePlace.name = "new name";

    final result = await useCase(params: examplePlace);

    expect(result, const Right(true));
    verify(databaseRepository.savePlace(any));
  });

  test("use case should return failure when place was not edited", ()async{
    reset(databaseRepository);
    when(databaseRepository.savePlace(any)).thenThrow(TestModels().exampleFailure);

    final result = await useCase(params: examplePlace);

    expect(result, Left(TestModels().exampleFailure));
    verify(databaseRepository.savePlace(any));
  });
}