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
    return GridTile(
      child: InkWell(
        onLongPress: () => _showBottomSheet(context),
        onTap: () => context.router.push(MainPlaceRoute(children: [PlaceRoute(place: place, id: place.id)])),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [const Placeholder(fallbackHeight: 200,), Text(place.name)],
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.remove),
                title: Text(AppLocalizations.of(context)!.remove),
                onTap: () => context.read<PlaceCubit>().remove(place.id),
              ),
              ListTile(
                leading: const Icon(Icons.drive_file_rename_outline),
                title: Text(AppLocalizations.of(context)!.rename),
                onTap: () => _showRenameAlert(context),
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
                      place.name = newName.value;
                      context.read<PlaceCubit>().edit(place);
                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.rename)),
                CloseButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
