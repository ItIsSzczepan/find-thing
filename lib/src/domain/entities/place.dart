import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'place.freezed.dart';

@Freezed()
class Place with _$Place {
  @Entity(realClass: Place)
  factory Place({
    @Id(assignable: true) int? id,
    @Unique(onConflict: ConflictStrategy.replace) String? uid,
    required String name,
    String? fileLocation,
  }) = _Place;
}
