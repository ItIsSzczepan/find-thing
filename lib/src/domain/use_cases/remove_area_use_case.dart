import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';

class RemoveAreaUseCase implements UseCase<bool, int> {
  final DatabaseRepository _databaseRepository;

  RemoveAreaUseCase(this._databaseRepository);

  @override
  Future<Either<Failure, bool>> call({required int params}) async {
    try {
      final bool result = await _databaseRepository.removeArea(params);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
