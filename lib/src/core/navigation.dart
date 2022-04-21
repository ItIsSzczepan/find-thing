import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/presentation/pages/image_crop_page.dart';
import 'package:find_thing/src/presentation/pages/note_page.dart';
import 'package:find_thing/src/presentation/pages/permission_page.dart';
import 'package:find_thing/src/presentation/pages/place_page.dart';
import 'package:find_thing/src/presentation/pages/places_list_page.dart';
import 'package:find_thing/src/presentation/pages/set_name_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: routes);

final List<GoRoute> routes = [
  GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) => const PlacesListPage(),
      routes: <GoRoute>[
        GoRoute(
            path: "permission",
            builder: (BuildContext context, GoRouterState state) =>
                PermissionPage(
                  onSuccess: state.extra! as Function,
                )),
        GoRoute(
            path: "imageCrop",
            builder: (BuildContext context, GoRouterState state) =>
                ImageCropPage(file: state.extra! as XFile),
            routes: [
              GoRoute(
                  path: "/setName",
                  builder: (BuildContext context, GoRouterState state) =>
                      SetNamePage(image: state.extra! as Image))
            ]),
        GoRoute(path: "places", redirect: (state) => "/"),
        GoRoute(
            path: "place/:placeId",
            builder: (BuildContext context, GoRouterState state) =>
                PlacePage(place: state.extra! as Place),
            routes: <GoRoute>[
              GoRoute(
                  path: "/area/:areaId",
                  builder: (BuildContext context, GoRouterState state) {
                    Map<String, dynamic> params =
                    state.extra! as Map<String, dynamic>;
                    final String title = params['title'];
                    final Function(String) onTitleSave = params['onTitleSave'];
                    final String content = params['content'];
                    final Function(String) onContentSave = params['onContentSave'];

                    return NotePage(
                        title: title,
                        content: content,
                        onTitleSave: onTitleSave,
                        onContentSave: onContentSave);
                  })
            ])
      ]),
];