import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/use_cases/get_places_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_places_use_case_test.mocks.dart';

@GenerateMocks([DatabaseRepository])
void main(){
  late GetPlacesUseCase useCase;
  late MockDatabaseRepository mockRepository;

  setUp((){
    mockRepository = MockDatabaseRepository();
    useCase = GetPlacesUseCase(mockRepository);
    reset(mockRepository);
  });

  test("useCase should return stream", ()async{
    when(mockRepository.getPlacesStream()).thenAnswer((realInvocation) async => const Stream.empty());

    final result = await useCase();

    expect(result, const Right(Stream.empty()));
    verify(mockRepository.getPlacesStream()).called(1);
  });

  test("useCase should return failure on error", ()async {
    when(mockRepository.getPlacesStream()).thenThrow(Exception());

    final result = await useCase();

    expect(result, isA<Left>());
    verify(mockRepository.getPlacesStream()).called(1);
  });
}