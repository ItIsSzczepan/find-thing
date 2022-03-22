import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/data/repositories/file_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../models.dart';
import 'file_repository_impl_test.mocks.dart';

@GenerateMocks([ImagePicker])
void main() {
  late FileRepositoryImpl fileRepositoryImpl;
  late ImagePicker fakeImagePicker;

  setUp(() {
    fakeImagePicker = MockImagePicker();
    fileRepositoryImpl = FileRepositoryImpl(fakeImagePicker);
  });

  final XFile exampleFile = TestModels().exampleFile;

  group("image picker select", () {
    test("should return file", () async {
      when(fakeImagePicker.pickImage(source: ImageSource.gallery))
          .thenAnswer((_) async => exampleFile);

      final result = await fileRepositoryImpl.pickImage(ImageSource.gallery);

      expect(result, Right(exampleFile));
      verify(fakeImagePicker.pickImage(source: ImageSource.gallery));
      verifyNoMoreInteractions(fakeImagePicker);
    });

    test("should return null failure", () async {
      when(fakeImagePicker.pickImage(source: ImageSource.gallery))
          .thenAnswer((_) async => null);

      final result = await fileRepositoryImpl.pickImage(ImageSource.gallery);

      expect(result, Left(NoFileSelectedFailure()));
      verify(fakeImagePicker.pickImage(source: ImageSource.gallery));
      verifyNoMoreInteractions(fakeImagePicker);
    });

    test("should return other failure", () async {
      Exception exception = Exception("test exception");
      when(fakeImagePicker.pickImage(source: ImageSource.gallery))
          .thenThrow(exception);

      final result = await fileRepositoryImpl.pickImage(ImageSource.gallery);

      expect(result, Left(Failure(exception.toString())));
      verify(fakeImagePicker.pickImage(source: ImageSource.gallery));
      verifyNoMoreInteractions(fakeImagePicker);
    });
  });
}
