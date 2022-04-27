import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceTile extends StatelessWidget {
  final Place place;

  const PlaceTile({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        bottom: 0.0,
        child: GridTile(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: place.fileLocation!.endsWith("test.png")
                      ? const Placeholder(
                          fallbackHeight: 200,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              constraints: const BoxConstraints.expand(),
                              child: Ink(
                                  child: Image.file(
                                File(place.fileLocation!),
                                fit: BoxFit.fill,
                              ))))),
              Text(
                place.name,
                style: Theme.of(context).textTheme.button,
              )
            ],
          ),
        ),
      ),
      Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onLongPress: () => _showBottomSheet(context),
              onTap: () => context.router.push(MainPlaceRoute(
                  children: [PlaceRoute(place: place, id: place.id)]))),
        ),
      ),
    ]);
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete),
                title: Text(AppLocalizations.of(context)!.remove),
                onTap: () {
                  context.read<PlaceCubit>().remove(place.id);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.drive_file_rename_outline),
                title: Text(AppLocalizations.of(context)!.rename),
                onTap: () {
                  Navigator.pop(context);
                  _showRenameAlert(context);
                },
              ),
            ],
          );
        });
  }

  _showRenameAlert(BuildContext context) {
    ValueNotifier<String> newName = ValueNotifier("");
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text(AppLocalizations.of(context)!.rename),
              content: TextField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterNewName),
                onChanged: (value) {
                  newName.value = value;
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      place.name = newName.value;
                      context.read<PlaceCubit>().edit(place);
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.rename)),
              ],
            ));
  }
}
