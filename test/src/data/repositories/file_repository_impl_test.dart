import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/data/repositories/file_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../../../models.dart';
import 'file_repository_impl_test.mocks.dart';

@GenerateMocks([ImagePicker])
void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  PathProviderPlatform.instance = FakePathProviderPlatform();


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

  group("retrieve lost image", () {
    test("should return file", () async {
      var testLostData = LostDataResponse(file: exampleFile);

      when(fakeImagePicker.retrieveLostData())
          .thenAnswer((_) async => testLostData);

      final result = await fileRepositoryImpl.retrieveLostImage();

      expect(result, Right(exampleFile));
      verify(fakeImagePicker.retrieveLostData());
      verifyNoMoreInteractions(fakeImagePicker);
    });

    test("should return null failure", () async {
      reset(fakeImagePicker);
      when(fakeImagePicker.retrieveLostData())
          .thenAnswer((_) async => LostDataResponse.empty());

      final result = await fileRepositoryImpl.retrieveLostImage();

      expect(result, Left(NoFileSelectedFailure()));
      verify(fakeImagePicker.retrieveLostData());
      verifyNoMoreInteractions(fakeImagePicker);
    });

    test("should return other failure", () async {
      PlatformException exception = PlatformException(code: "123");

      reset(fakeImagePicker);
      when(fakeImagePicker.retrieveLostData()).thenAnswer((_) async => LostDataResponse(exception: exception));

      final result = await fileRepositoryImpl.retrieveLostImage();

      expect(result, Left(Failure(exception.toString())));
      verify(fakeImagePicker.retrieveLostData());
      verifyNoMoreInteractions(fakeImagePicker);
    });
  });

  group("save image", (){
    String filePath = "";
    test("should save file", () async {
      final String result = await fileRepositoryImpl.saveImage(image: await createTestImage(), uid: "123123123");

      expect(File(result).existsSync(), true);
      filePath = result;
    });

    test("should delete file", () async {
      await fileRepositoryImpl.deleteImage(filePath);

      expect(File(filePath).existsSync(), false);
    });

    tearDownAll((){
      Directory("./test/photos/").deleteSync();
    });
  });
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async{
    return "./test/";
  }
}
