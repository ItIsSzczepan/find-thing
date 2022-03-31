import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/data/data_sources/daos/place_dao.dart';
import 'package:find_thing/src/domain/entities/place.dart';

class ObjectBoxDatabase{
  late final Store _store;
  late final PlaceDao _placeDao;

  Future<void> create({bool? test}) async {
    if(test != null && test){
      _store = await openStore(directory: "./test/objectbox/");
    }else{
      _store = await openStore();
    }

    _placeDao = PlaceDao(_store.box<Place>());
  }

  PlaceDao get placeDao => _placeDao;

  dispose(){
    _store.close();
  }
}