import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl extends DatabaseRepository {
  final ObjectBoxDatabase _objectBoxDatabase;

  DatabaseRepositoryImpl(this._objectBoxDatabase);

  @override
  Future<Place> createNewPlace({required String name}) async {
    Place newPlace = Place(name: name);
    final newPlaceId = _objectBoxDatabase.placeDao.save(newPlace);
    newPlace = await _objectBoxDatabase.placeDao.get(newPlaceId);

    return newPlace;
  }

  @override
  Future<int> savePlace(Place place) async {
    List<Place> allPlaces = _objectBoxDatabase.placeDao.getAll();
    for (var placeInList in allPlaces) {
      if (placeInList.uid == place.uid) {
        return _objectBoxDatabase.placeDao.save(place);
      }
    }
    throw Exception(
        "Can't save place that is not saved before without creating new one by function");
  }

  @override
  Future<bool> removePlace(int id) async {
    return _objectBoxDatabase.removePlaceWithAreas(id);
  }

  @override
  Future<bool> removeArea(int id) async{
    return _objectBoxDatabase.areaDao.remove(id);
  }

  @override
  Future<int> saveArea(Area area) async{
    if(area.place.target == null) throw(Exception("Can't save area without target place"));
    return _objectBoxDatabase.areaDao.save(area);
  }

  @override
  Future<Stream> getPlacesStream() async{
    return _objectBoxDatabase.placeDao.allPlacesStream;
  }
}
