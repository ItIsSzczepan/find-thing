import 'package:find_thing/src/domain/entities/place.dart';

abstract class DatabaseRepository{
  void savePlace(Place newPlace);

}