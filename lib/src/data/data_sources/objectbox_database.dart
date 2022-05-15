import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/data/data_sources/daos/area_dao.dart';
import 'package:find_thing/src/data/data_sources/daos/place_dao.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';

class ObjectBoxDatabase {
  late final Store _store;
  late final PlaceDao _placeDao;
  late final AreaDao _areaDao;
  static bool initialized = false;

  Future<void> create({bool? test}) async {
    if(!initialized) {
      if (test != null && test) {
        _store = await openStore(directory: "./test/objectbox/");
      } else {
        _store = await openStore();
      }

      _placeDao = PlaceDao(_store.box<Place>());
      _areaDao = AreaDao(_store.box<Area>());
      initialized = true;
    }
  }

  PlaceDao get placeDao => _placeDao;

  AreaDao get areaDao => _areaDao;

  Future<bool> removePlaceWithAreas(int placeId) async {
    return _store.runInTransaction(TxMode.write, () {
      try {
        Place place = placeDao.get(placeId);
        List<int> areasIds = place.areas.map((element) => element.id).toList();

        placeDao.remove(placeId);
        areaDao.removeManyAreas(areasIds);
        return true;
      } catch (e) {
        return false;
      }
    });
  }

  dispose() {
    _store.close();
  }
}
