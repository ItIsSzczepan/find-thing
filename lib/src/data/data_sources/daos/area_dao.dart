import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/domain/entities/area.dart';

class AreaDao {
  final Box<Area> _box;

  AreaDao(this._box);

  get(int id) => _box.get(id);

  save(Area area) => _box.put(area);

  remove(int id) => _box.remove(id);

  removeManyAreas(List<int> ids) => _box.removeMany(ids);
}
