import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';

class EditPlaceUseCase implements UseCase<bool, Place>{
  final DatabaseRepository _databaseRepository;

  EditPlaceUseCase(this._databaseRepository);

  @override
  Future<Either<Failure, bool>> call({required Place params}) async {
    try{
      final int id = await _databaseRepository.savePlace(params);
      if(id == 0) return const Right(false);
      return const Right(true);
    }catch (e){
      return Left(Failure(e.toString()));
    }
  }

}