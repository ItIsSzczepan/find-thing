import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/params.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';

class SaveImageUseCase implements UseCase<bool, SaveImageParams>{
  final FileRepository _fileRepository;
  final DatabaseRepository _databaseRepository;

  SaveImageUseCase(this._fileRepository, this._databaseRepository);

  @override
  Future<Either<Failure, bool>> call({required params}) async {
    Place? newPlace;

    try {
      newPlace = await _databaseRepository.createNewPlace(name: params.name);
      String uid = newPlace.uid!;

      String path = await _fileRepository.saveImage(image: params.image, uid: uid);
      newPlace = newPlace.copyWith(fileLocation: path);
      await _databaseRepository.savePlace(newPlace);

      return const Right(true);
    }catch (e){
      if(newPlace != null) _databaseRepository.removePlace(newPlace);
      return Left(Failure(e.toString()));
    }
  }

}