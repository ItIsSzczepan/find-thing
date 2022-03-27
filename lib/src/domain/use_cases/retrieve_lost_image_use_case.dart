import 'package:dartz/dartz.dart';
import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/core/usecase.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/params.dart';

class RetrieveLostImageUseCase implements UseCase<XFile?, Params?>{
  final FileRepository _fileRepository;

  RetrieveLostImageUseCase(this._fileRepository);

  @override
  Future<Either<Failure, XFile?>> call({params}) {
    return _fileRepository.retrieveLostImage();
  }
}