import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class FileRepository{
  // image picker
  Future<Either<Failure, XFile>> pickImage(ImageSource imageSource);

  Future<Either<Failure, XFile>> retrieveLostImage();
}