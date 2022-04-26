import 'package:auto_route/auto_route.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:find_thing/src/presentation/widgets/failure_snackbar.dart';
import 'package:find_thing/src/presentation/widgets/place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: MultiBlocListener(
            listeners: [
              BlocListener<PermissionCubit, PermissionCubitState>(
                  bloc: context.read<PermissionCubit>()..checkFile(),
                  listener: (context, state) {
                    if (state is PermissionData) {
                      if (state.permissions[Permissions.file] !=
                          PermissionStatus.granted) {
                        context.router.push(PermissionRoute(onSuccess: ()=>context.router.replace(PlacesListRoute())));
                      }
                    }
                    if (state is PermissionFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          failureSnackBar(failure: state.failure));
                    }
                  }),
              BlocListener<ImageCubit, ImageCubitState>(
                  bloc: context.read<ImageCubit>()..retrieveImage(),
                  listener: (context, state) {
                    if (state is ImagePicked) {
                      context.router.push(MainImageCropRoute(children: [ImageCropRoute(file: state.file)]));
                    }
                    if (state is ImageFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          failureSnackBar(failure: state.failure));
                    }
                  }),
            ],
            child: BlocBuilder<PlaceCubit, PlaceCubitState>(
                bloc: context.read<PlaceCubit>(),
                builder: (context, state) {
                  // get stream
                  if(state is PlaceFailure) {
                    failureSnackBar(failure: state.failure);
                    context.read<PlaceCubit>().getPlaces();
                    return CircularProgressIndicator();
                  }
                  if (state is PlaceInitial) {
                    return Center(
                        child: Text(
                            AppLocalizations.of(context)!.emptyPlacesText));
                  }
                  state as PlaceData;
                  Stream<List<Place>> placeListQueryStream =
                      state.stream.map((q) => q.find());

                  return StreamBuilder<List<Place>>(
                      stream: placeListQueryStream,
                      builder: (context, snapshot) {
                        // load places from stream
                        List<Place> places = snapshot.data ?? [];

                        if (places.isEmpty) {
                          return Center(
                              child: Text(AppLocalizations.of(context)!
                                  .emptyPlacesText));
                        }

                        // build list of places
                        return GridView.builder(
                            itemCount: places.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) =>
                                PlaceTile(place: places[index]));
                      });
                })),
      ),
      floatingActionButton: _buildFAB(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.title),
    );
  }

  Widget _buildFAB(BuildContext context) {
    RoundedRectangleBorder shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0));
    return SpeedDial(
      child: const Icon(Icons.add),
      shape: shape,
      spacing: 10.0,
      children: [
        SpeedDialChild(
          shape: shape,
            onTap: () =>
                context.read<ImageCubit>().pickImage(ImageSource.camera),
            child: const Icon(Icons.camera_alt),
            label: AppLocalizations.of(context)!.camera),
        SpeedDialChild(
          shape: shape,
            onTap: () =>
                context.read<ImageCubit>().pickImage(ImageSource.gallery),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
              child: Icon(Icons.collections),
            ),
            label: AppLocalizations.of(context)!.gallery),
      ],
    );
  }
}
