// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/domain/entities/place.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4635599271720067292),
      name: 'Place',
      lastPropertyId: const IdUid(4, 4238998201203533351),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2598118975058114424),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 7091305741886185844),
            name: 'uid',
            type: 9,
            flags: 34848,
            indexId: const IdUid(1, 8582816604463808466)),
        ModelProperty(
            id: const IdUid(3, 4592830757626326087),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4238998201203533351),
            name: 'fileLocation',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 4635599271720067292),
      lastIndexId: const IdUid(1, 8582816604463808466),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Place: EntityDefinition<Place>(
        model: _entities[0],
        toOneRelations: (Place object) => [],
        toManyRelations: (Place object) => {},
        getId: (Place object) => object.id,
        setId: (Place object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field Place.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (Place object, fb.Builder fbb) {
          final uidOffset =
              object.uid == null ? null : fbb.writeString(object.uid!);
          final nameOffset = fbb.writeString(object.name);
          final fileLocationOffset = object.fileLocation == null
              ? null
              : fbb.writeString(object.fileLocation!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, uidOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, fileLocationOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Place(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              uid: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              fileLocation: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Place] entity fields to define ObjectBox queries.
class Place_ {
  /// see [Place.id]
  static final id = QueryIntegerProperty<Place>(_entities[0].properties[0]);

  /// see [Place.uid]
  static final uid = QueryStringProperty<Place>(_entities[0].properties[1]);

  /// see [Place.name]
  static final name = QueryStringProperty<Place>(_entities[0].properties[2]);

  /// see [Place.fileLocation]
  static final fileLocation =
      QueryStringProperty<Place>(_entities[0].properties[3]);
}
