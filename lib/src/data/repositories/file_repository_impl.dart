import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';

class FileRepositoryImpl implements FileRepository{
  final ImagePicker _imagePicker;

  FileRepositoryImpl(this._imagePicker);

  @override
  Future<Either<Failure, XFile>> pickImage(ImageSource imageSource) async{
    try{
      XFile? file = await _imagePicker.pickImage(source: imageSource);
      if(file == null) throw NoFileSelectedFailure();
      return Right(file);
    }on Failure catch(f){
      return Left(f);
    }catch (e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, XFile>> retrieveLostImage() async {
    final LostDataResponse response =
        await _imagePicker.retrieveLostData();
    if (response.isEmpty) {
      return Left(NoFileSelectedFailure());
    }
    if (response.file != null) {
      XFile? xFile = response.file;
      return Right(xFile!);
    } else {
      return Left(Failure(response.exception.toString()));
    }
  }
}