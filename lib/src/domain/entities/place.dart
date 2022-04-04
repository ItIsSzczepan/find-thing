import 'package:find_thing/src/domain/entities/area.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

@Entity()
class Place {
  @Id()
  late int id;

  @Unique(onConflict: ConflictStrategy.replace)
  late String? uid;

  late String name;
  String? fileLocation;

  @Backlink()
  final areas = ToMany<Area>();

  Place({this.id = 0, String? uid, required this.name, this.fileLocation}){
    // ignore: prefer_const_constructors
    this.uid = uid ?? Uuid().v4();
  }
}
