import 'dart:io';

import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/presentation/cubits/area_cubit/area_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:find_thing/src/presentation/widgets/area_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PlacePage extends StatefulWidget {
  final Place place;
  final int id;

  const PlacePage(
      {Key? key, required this.place, @PathParam('placeId') required this.id})
      : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  int editAreaId = -1;
  GlobalKey<AreaWidgetState>? areaKey;

  @override
  Widget build(BuildContext context) {
    Image _image = Image.file(File(widget.place.fileLocation!));
    double? imageHeight = _image.height;
    double? imageWidth = _image.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
          child: Stack(
        key: Key("Image Stack"),
        alignment: Alignment.center,
        children: [_image, ..._buildAreas(context)],
      )),
      bottomNavigationBar: editAreaId != -1
          ? const BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Text("bottomappbar"),
            )
          : null,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.place.name),
      leading: BackButton(onPressed: () => context.router.pop()),
      actions: [
        IconButton(
            onPressed: () {
              Area area = Area();
              setState(() {
                widget.place.areas.add(area);
              });

              context.read<PlaceCubit>().edit(widget.place);
            },
            icon: const Icon(Icons.add))
      ],
    );
  }

  List<AreaWidget> _buildAreas(BuildContext context,
      {double maxHeight = double.infinity, double maxWidth = double.infinity}) {
    List<AreaWidget> list = [];

    for (Area area in widget.place.areas) {
      final key = GlobalKey<AreaWidgetState>();
      AreaCubit cubit = GetIt.I<AreaCubit>(param1: area)..emit(area);
      list.add(AreaWidget(
        key: area.id == editAreaId ? areaKey : key,
        editing: area.id == editAreaId,
        x: area.x,
        y: area.y,
        shape: area.shape,
        onMove: (x, y) {
          cubit.move(x: x, y: y);
        },
        onResize: (double? width, double? height, double? radius) {
          cubit.size(width: width, height: height);
        },
        onColorChange: (color) {},
        onTap: () {
          context.router.push(NoteRoute(
              id: area.id,
              title: area.name,
              content: area.content.toString(),
              onTitleSave: (value) {},
              onContentSave: (value) {}));
        },
        width: area.width!,
        maxHeight: maxHeight,
        height: area.height!,
        maxWidth: maxWidth,
        onLongPress: () {
          if (editAreaId == area.id) {
            setState(() {
              editAreaId = -1;
            });
          } else {
            setState(() {
              editAreaId = area.id;
            });
          }
        },
        color: Colors.blue,
      ));
    }

    return list;
  }
}
