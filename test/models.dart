import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:image_picker/image_picker.dart';

class TestModels {
  Failure get exampleFailure => Failure("example failure");

  XFile get exampleFile => XFile("/test.txt");

  String get examplePlaceName => "test place";

  Place get examplePlace => Place(
      name: "test place",
      id: 123,
      uid: "123123123",
      fileLocation: "./test/photos/123123123.png");
}
