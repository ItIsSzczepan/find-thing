import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:image_picker/image_picker.dart';

class UserPickImageUseCase implements UseCase<XFile?, ImageSource>{
  final FileRepository _fileRepository;

  UserPickImageUseCase(this._fileRepository);

  @override
  Future<Either<Failure, XFile?>> call({required ImageSource params}){
    return _fileRepository.pickImage(params);
  }
}