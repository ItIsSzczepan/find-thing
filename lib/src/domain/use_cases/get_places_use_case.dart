import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';

class GetPlacesUseCase implements UseCase<void, Stream>{
  final DatabaseRepository _databaseRepository;

  GetPlacesUseCase(this._databaseRepository);

  @override
  Future<Either<Failure, Stream>> call({void params}) async {
    try{
      Stream result = await _databaseRepository.getPlacesStream();
      return Right(result);
    }catch (e){
      return Left(Failure(e.toString()));
    }
  }

}