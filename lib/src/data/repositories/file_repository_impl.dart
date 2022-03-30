import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/constant.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

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

  @override
  Future<String> saveImage({required Image image, required String uid}) async {
    String filePath = await _getFilePath(uid);

    var imageBytes = await image.toByteData(format: ImageByteFormat.png);
    List<int> imageIntListData = imageBytes!.buffer.asInt8List();

    File newFile = File(filePath);
    await newFile.writeAsBytes(imageIntListData);

    return filePath;
  }

  Future<String> _getFilePath(String name) async {
    final directory = await getApplicationDocumentsDirectory();
    String basePath = await _checkFolderExits(directory, photosFilesUrl);
    String path = "$basePath/$name.png";

    return path;
  }

  Future<String> _checkFolderExits(Directory dir, String folderName) async {
    Directory checkDir = Directory(join(dir.path, folderName));

    if(await checkDir.exists()){
      return checkDir.path;
    }else{
      Directory newDir = await checkDir.create(recursive: true);
      return newDir.path;
    }
  }

  @override
  Future<void> deleteImage(String path) async {
    File(path).deleteSync();
  }
}