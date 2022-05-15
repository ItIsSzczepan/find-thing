import 'dart:typed_data';

abstract class Params{}

class SaveImageParams extends Params{
  Uint8List image;
  String name;

  SaveImageParams({required this.image, required this.name});
}