import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/repositories/permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckAndAskPermissionUseCase implements UseCase<PermissionStatus, Permissions>{
  final PermissionRepository _repository;

  CheckAndAskPermissionUseCase(this._repository);

  @override
  Future<Either<Failure, PermissionStatus>> call({required Permissions params}) async {
    try{
      PermissionStatus status;

      switch(params){
        case Permissions.file:
          status = await _repository.check(Permission.storage);
          break;
        default:
          throw Exception("Wrong permission selected (not implemented yet)");
      }
      return Right(status);
    }catch (e){
      return Left(Failure(e.toString()));
    }
  }
}

enum Permissions{
  file
}