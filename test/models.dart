import 'dart:typed_data';
import 'dart:ui';

import 'package:find_thing/src/core/failure.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:flutter_test/flutter_test.dart';
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

  Area get exampleArea => Area(id: 12);

  Uint8List get exampleImageData2 => Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  Future<Uint8List> get exampleImageData async {
    Image image = await createTestImage(width: 200, height: 200);
    ByteData? byteData = await image.toByteData();
    return byteData!.buffer.asUint8List();
  }
}
