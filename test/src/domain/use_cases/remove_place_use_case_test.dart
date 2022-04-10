import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/use_cases/remove_place_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remove_place_use_case_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main(){
  late RemovePlaceUseCase useCase;
  late MockDatabaseRepository mockRepository;

  setUp((){
    mockRepository = MockDatabaseRepository();
    useCase = RemovePlaceUseCase(mockRepository);
    reset(mockRepository);
  });

  test("useCase should return true if place was removed", ()async{
    when(mockRepository.removePlace(any)).thenAnswer((_) async => true);

    final result = await useCase(params: 0);

    expect(result, const Right(true));
    verify(mockRepository.removePlace(any)).called(1);
  });

  test("useCase should return false if place wasn't removed", ()async{
    when(mockRepository.removePlace(any)).thenAnswer((_) async => false);

    final result = await useCase(params: 0);

    expect(result, const Right(false));
    verify(mockRepository.removePlace(any)).called(1);
  });

  test("useCase should return left Failure on error", ()async{
    when(mockRepository.removePlace(any)).thenThrow(Exception("test"));

    final result = await useCase(params: 0);

    expect(result, isA<Left>());
    verify(mockRepository.removePlace(any)).called(1);
  });
}