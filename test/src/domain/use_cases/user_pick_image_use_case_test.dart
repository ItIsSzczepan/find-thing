import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:find_thing/src/domain/use_cases/user_pick_image_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../models.dart';
import 'user_pick_image_use_case_test.mocks.dart';

@GenerateMocks([FileRepository])
void main() {
  late UserPickImageUseCase useCase;
  late FileRepository fakeFileRepository;

  setUp(() {
    fakeFileRepository = MockFileRepository();
    useCase = UserPickImageUseCase(fakeFileRepository);
  });

  final XFile exampleFile = TestModels().exampleFile;

  test("should return file", () async {
    when(fakeFileRepository.pickImage(ImageSource.gallery))
        .thenAnswer((realInvocation) async => Right(exampleFile));

    final result = await useCase(params: ImageSource.gallery);

    expect(result, Right(exampleFile));
    verify(fakeFileRepository.pickImage(ImageSource.gallery));
    verifyNoMoreInteractions(fakeFileRepository);
  });

  test("should return null", () async {
    reset(fakeFileRepository);
    when(fakeFileRepository.pickImage(ImageSource.gallery))
        .thenAnswer((realInvocation) async => Left(NoFileSelectedFailure()));

    final result = await useCase(params: ImageSource.gallery);

    expect(result, Left(NoFileSelectedFailure()));
    verify(fakeFileRepository.pickImage(ImageSource.gallery));
    verifyNoMoreInteractions(fakeFileRepository);
  });

  test("should return failure", () async {
    reset(fakeFileRepository);
    when(fakeFileRepository.pickImage(ImageSource.gallery))
        .thenAnswer((realInvocation) async => Left(TestModels().exampleFailure));

    final result = await useCase(params: ImageSource.gallery);

    expect(result, Left(TestModels().exampleFailure));
    verify(fakeFileRepository.pickImage(ImageSource.gallery));
    verifyNoMoreInteractions(fakeFileRepository);
  });
}
