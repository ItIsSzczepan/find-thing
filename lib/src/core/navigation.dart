import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/presentation/pages/image_crop_page.dart';
import 'package:find_thing/src/presentation/pages/image_place_save_wrapper.dart';
import 'package:find_thing/src/presentation/pages/note_page.dart';
import 'package:find_thing/src/presentation/pages/permission_page.dart';
import 'package:find_thing/src/presentation/pages/place_page.dart';
import 'package:find_thing/src/presentation/pages/places_list_page.dart';
import 'package:find_thing/src/presentation/pages/set_name_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'navigation.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: PlacesListPage, initial: true),
    AutoRoute(path: "/permission", page: PermissionPage),
    AutoRoute(
        path: "/imageCrop",
        name: "MainImageCropRoute",
        page: ImagePlaceSavingWrapper,
        children: [
          AutoRoute(path: "", name: "ImageCropRoute", page: ImageCropPage),
          AutoRoute(path: "setName", name: "SetNameRoute", page: SetNamePage),
          RedirectRoute(path: "*", redirectTo: 'PlacesListRoute')
        ]),
    AutoRoute(path: '/place', name: "MainPlaceRoute", page: EmptyRouterPage, children: [
      AutoRoute(
          path: ":placeId",
          page: PlacePage,
          children: [AutoRoute(path: "area/:areaId", page: NotePage)]),
      RedirectRoute(path: "*", redirectTo: 'PlacesListRoute')
    ]),
    RedirectRoute(path: "/*", redirectTo: 'PlacesListRoute')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
