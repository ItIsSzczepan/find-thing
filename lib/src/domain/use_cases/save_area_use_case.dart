import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';

class SaveAreaUseCase implements UseCase<int, Area> {
  final DatabaseRepository _databaseRepository;

  SaveAreaUseCase(this._databaseRepository);

  @override
  Future<Either<Failure, int>> call({required Area params}) async {
    if (params.place.target != null) {
      try {
        final id = await _databaseRepository.saveArea(params);
        return Right(id);
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    } else {
      return Left(Failure("Area have to have place attached"));
    }
  }
}
