import 'package:equatable/equatable.dart';
import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Area extends Equatable {
  @Id()
  int id;

  double x, y;
  Shape shape;

  double? width, height, radius;
  String? content;

  final place = ToOne<Place>();

  int get dbShape{
    return shape.index;
  }

  set dbShape(int value){
    shape = Shape.values[value];
  }

  Area(
      {this.id = 0,
      this.content,
      this.x = 100,
      this.y = 100,
      this.shape = Shape.rect,
      this.width = 50,
      this.height = 50,
      this.radius = 50});

  @override
  List<Object?> get props => [id, x, y, shape, width, height, radius, content];
}

enum Shape { rect, circle }
