import 'package:find_thing/src/domain/entities/place.dart';

abstract class DatabaseRepository{
  // Places
  Future<Place> createNewPlace({required String name});
  Future<int> savePlace(Place place);
  Future<bool> removePlace(int id);
}