import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/params.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:flutter/cupertino.dart';

class SaveImageUseCase implements UseCase<bool, SaveImageParams>{
  final FileRepository _fileRepository;
  final DatabaseRepository _databaseRepository;

  SaveImageUseCase(this._fileRepository, this._databaseRepository);

  @override
  Future<Either<Failure, bool>> call({required params}) async {
    Place newPlace = Place(name: params.name);
    String uid = newPlace.uid!;

    try {
      String path = await _fileRepository.saveImage(image: params.image, uid: uid);
      newPlace = newPlace.copyWith(fileLocation: path);
      _databaseRepository.savePlace(newPlace);

      return const Right(true);
    }on IOException catch(e){
      return Left(Failure(e.toString()));
    }
  }

}