// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Area extends Equatable {
  @Id()
  int id;
  String name = "";

  double x, y;
  Shape shape;
  String color;

  double? width, height, radius;
  String? content;

  final place = ToOne<Place>();

  int get dbShape {
    return shape.index;
  }

  set dbShape(int value) {
    shape = Shape.values[value];
  }

  Area(
      {this.id = 0,
      this.name = "",
      this.content,
      this.x = 100,
      this.y = 100,
      this.shape = Shape.rect,
      this.width = 50,
      this.height = 50,
      this.radius = 50,
      this.color = "0x010000ff"});

  @override
  List<Object?> get props =>
      [id, x, y, shape, width, height, radius, content, color, name];
}

enum Shape { rect, circle }
