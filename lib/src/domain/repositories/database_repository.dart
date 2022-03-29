import 'package:find_thing/src/domain/entities/place.dart';

abstract class DatabaseRepository{
  Future<Place> createNewPlace({String name});

  Future<void> savePlace(Place place);

  Future<void> removePlace(Place place);
}