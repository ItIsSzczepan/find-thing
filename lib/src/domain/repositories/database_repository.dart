import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';

abstract class DatabaseRepository{
  // Places
  Future<Place> createNewPlace({required String name});
  Future<int> savePlace(Place place);
  Future<bool> removePlace(int id);
  Future<Stream> getPlacesStream();

  // Areas
  Future<int> saveArea(Area area);
  Future<bool> removeArea(int id);
}