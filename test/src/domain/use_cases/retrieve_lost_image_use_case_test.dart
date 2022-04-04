import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:find_thing/src/domain/use_cases/retrieve_lost_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../models.dart';
import 'retrieve_lost_image_use_case_test.mocks.dart';

@GenerateMocks([FileRepository])
void main() {
  late RetrieveLostImageUseCase useCase;
  late FileRepository mockFileRepository;

  setUp(() {
    mockFileRepository = MockFileRepository();
    useCase = RetrieveLostImageUseCase(mockFileRepository);
  });

  XFile exampleFile = TestModels().exampleFile;

  test("should return file", () async {
    when(mockFileRepository.retrieveLostImage())
        .thenAnswer((realInvocation) async => Right(exampleFile));

    final result = await useCase();

    expect(result, Right(exampleFile));
    verify(mockFileRepository.retrieveLostImage()).called(1);
    verifyNoMoreInteractions(mockFileRepository);
  });

  test("should return null", () async {
    reset(mockFileRepository);
    when(mockFileRepository.retrieveLostImage())
        .thenAnswer((realInvocation) async => Left(NoFileSelectedFailure()));

    final result = await useCase();

    expect(result, Left(NoFileSelectedFailure()));
    verify(mockFileRepository.retrieveLostImage());
    verifyNoMoreInteractions(mockFileRepository);
  });

  test("should return failure", () async {
    reset(mockFileRepository);
    when(mockFileRepository.retrieveLostImage()).thenAnswer(
        (realInvocation) async => Left(TestModels().exampleFailure));

    final result = await useCase();

    expect(result, Left(TestModels().exampleFailure));
    verify(mockFileRepository.retrieveLostImage()).called(1);
    verifyNoMoreInteractions(mockFileRepository);
  });
}
