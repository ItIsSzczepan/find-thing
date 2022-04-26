import 'package:find_thing/src/domain/entities/place.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class PlacePage extends StatelessWidget {
  final Place place;
  final int id;

  const PlacePage(
      {Key? key, required this.place, @PathParam('placeId') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
