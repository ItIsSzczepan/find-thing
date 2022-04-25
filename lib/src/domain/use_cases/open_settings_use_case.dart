import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/params.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/repositories/permission_repository.dart';

class OpenSettingsUseCase implements UseCase<bool, Params?>{
  final PermissionRepository _repository;

  OpenSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call({params}) async {
    try{
      return Right(await _repository.openSettings());
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }
}