import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class FileRepository{
  // image picker
  Future<Either<Failure, XFile>> pickImage(ImageSource imageSource);

  Future<Either<Failure, XFile>> retrieveLostImage();

  Future<String> saveImage({required Uint8List image, required String uid});

  Future<void> deleteImage(String path);
}