import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

@Entity()
class Place {
  @Id(assignable: true)
  late int id;

  @Unique(onConflict: ConflictStrategy.replace)
  late String? uid;

  late String name;
  String? fileLocation;

  Place({this.id = 0, String? uid, required this.name, this.fileLocation}){
    this.uid = uid ?? Uuid().v4();
  }
}
