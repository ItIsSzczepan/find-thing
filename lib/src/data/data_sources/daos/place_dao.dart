import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/domain/entities/place.dart';

class PlaceDao {
  final Box<Place> _box;

  PlaceDao(this._box);

  get(int id) => _box.get(id);

  getAll() => _box.getAll();

  save(Place place) => _box.put(place);

  remove(int id) => _box.remove(id);

  Stream<Query<Place>> get allPlacesStream => _box.query(Place_.id > 0).watch(triggerImmediately: true);
}
