import 'dart:ui';

abstract class Params{}

class SaveImageParams extends Params{
  Image image;
  String name;

  SaveImageParams({required this.image, required this.name});
}