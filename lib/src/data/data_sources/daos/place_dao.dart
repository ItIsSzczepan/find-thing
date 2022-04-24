import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/domain/entities/place.dart';

class PlaceDao {
  final Box<Place> _box;

  PlaceDao(this._box);

  get(int id) => _box.get(id);

  List<Place> getAll() => _box.getAll();

  int save(Place place) => _box.put(place);

  bool remove(int id) => _box.remove(id);

  Stream<Query<Place>> get allPlacesStream => _box.query().watch(triggerImmediately: true);
}
