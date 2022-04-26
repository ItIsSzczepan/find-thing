// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'navigation.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PlacesListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PlacesListPage());
    },
    PermissionRoute.name: (routeData) {
      final args = routeData.argsAs<PermissionRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: PermissionPage(key: args.key, onSuccess: args.onSuccess));
    },
    MainImageCropRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    MainPlaceRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ImageCropRoute.name: (routeData) {
      final args = routeData.argsAs<ImageCropRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: ImageCropPage(key: args.key, file: args.file));
    },
    SetNameRoute.name: (routeData) {
      final args = routeData.argsAs<SetNameRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: SetNamePage(key: args.key, image: args.image));
    },
    PlaceRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: PlacePage(key: args.key, place: args.place, id: args.id));
    },
    NoteRoute.name: (routeData) {
      final args = routeData.argsAs<NoteRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: NotePage(
              key: args.key,
              id: args.id,
              title: args.title,
              content: args.content,
              onTitleSave: args.onTitleSave,
              onContentSave: args.onContentSave));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(PlacesListRoute.name, path: '/'),
        RouteConfig(PermissionRoute.name, path: '/permission'),
        RouteConfig(MainImageCropRoute.name, path: '/imageCrop', children: [
          RouteConfig(ImageCropRoute.name,
              path: '', parent: MainImageCropRoute.name),
          RouteConfig(SetNameRoute.name,
              path: 'setName', parent: MainImageCropRoute.name),
          RouteConfig('*#redirect',
              path: '*',
              parent: MainImageCropRoute.name,
              redirectTo: 'PlacesListRoute',
              fullMatch: true)
        ]),
        RouteConfig(MainPlaceRoute.name, path: '/place', children: [
          RouteConfig(PlaceRoute.name,
              path: ':placeId',
              parent: MainPlaceRoute.name,
              children: [
                RouteConfig(NoteRoute.name,
                    path: 'area/:areaId', parent: PlaceRoute.name)
              ]),
          RouteConfig('*#redirect',
              path: '*',
              parent: MainPlaceRoute.name,
              redirectTo: 'PlacesListRoute',
              fullMatch: true)
        ]),
        RouteConfig('/*#redirect',
            path: '/*', redirectTo: 'PlacesListRoute', fullMatch: true)
      ];
}

/// generated route for
/// [PlacesListPage]
class PlacesListRoute extends PageRouteInfo<void> {
  const PlacesListRoute() : super(PlacesListRoute.name, path: '/');

  static const String name = 'PlacesListRoute';
}

/// generated route for
/// [PermissionPage]
class PermissionRoute extends PageRouteInfo<PermissionRouteArgs> {
  PermissionRoute({Key? key, required Function onSuccess})
      : super(PermissionRoute.name,
            path: '/permission',
            args: PermissionRouteArgs(key: key, onSuccess: onSuccess));

  static const String name = 'PermissionRoute';
}

class PermissionRouteArgs {
  const PermissionRouteArgs({this.key, required this.onSuccess});

  final Key? key;

  final Function onSuccess;

  @override
  String toString() {
    return 'PermissionRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class MainImageCropRoute extends PageRouteInfo<void> {
  const MainImageCropRoute({List<PageRouteInfo>? children})
      : super(MainImageCropRoute.name,
            path: '/imageCrop', initialChildren: children);

  static const String name = 'MainImageCropRoute';
}

/// generated route for
/// [EmptyRouterPage]
class MainPlaceRoute extends PageRouteInfo<void> {
  const MainPlaceRoute({List<PageRouteInfo>? children})
      : super(MainPlaceRoute.name, path: '/place', initialChildren: children);

  static const String name = 'MainPlaceRoute';
}

/// generated route for
/// [ImageCropPage]
class ImageCropRoute extends PageRouteInfo<ImageCropRouteArgs> {
  ImageCropRoute({Key? key, required XFile file})
      : super(ImageCropRoute.name,
            path: '', args: ImageCropRouteArgs(key: key, file: file));

  static const String name = 'ImageCropRoute';
}

class ImageCropRouteArgs {
  const ImageCropRouteArgs({this.key, required this.file});

  final Key? key;

  final XFile file;

  @override
  String toString() {
    return 'ImageCropRouteArgs{key: $key, file: $file}';
  }
}

/// generated route for
/// [SetNamePage]
class SetNameRoute extends PageRouteInfo<SetNameRouteArgs> {
  SetNameRoute({Key? key, required Image image})
      : super(SetNameRoute.name,
            path: 'setName', args: SetNameRouteArgs(key: key, image: image));

  static const String name = 'SetNameRoute';
}

class SetNameRouteArgs {
  const SetNameRouteArgs({this.key, required this.image});

  final Key? key;

  final Image image;

  @override
  String toString() {
    return 'SetNameRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [PlacePage]
class PlaceRoute extends PageRouteInfo<PlaceRouteArgs> {
  PlaceRoute(
      {Key? key,
      required Place place,
      required int id,
      List<PageRouteInfo>? children})
      : super(PlaceRoute.name,
            path: ':placeId',
            args: PlaceRouteArgs(key: key, place: place, id: id),
            rawPathParams: {'placeId': id},
            initialChildren: children);

  static const String name = 'PlaceRoute';
}

class PlaceRouteArgs {
  const PlaceRouteArgs({this.key, required this.place, required this.id});

  final Key? key;

  final Place place;

  final int id;

  @override
  String toString() {
    return 'PlaceRouteArgs{key: $key, place: $place, id: $id}';
  }
}

/// generated route for
/// [NotePage]
class NoteRoute extends PageRouteInfo<NoteRouteArgs> {
  NoteRoute(
      {Key? key,
      required int id,
      required String title,
      required String content,
      required dynamic Function(String) onTitleSave,
      required dynamic Function(String) onContentSave})
      : super(NoteRoute.name,
            path: 'area/:areaId',
            args: NoteRouteArgs(
                key: key,
                id: id,
                title: title,
                content: content,
                onTitleSave: onTitleSave,
                onContentSave: onContentSave),
            rawPathParams: {'areaId': id});

  static const String name = 'NoteRoute';
}

class NoteRouteArgs {
  const NoteRouteArgs(
      {this.key,
      required this.id,
      required this.title,
      required this.content,
      required this.onTitleSave,
      required this.onContentSave});

  final Key? key;

  final int id;

  final String title;

  final String content;

  final dynamic Function(String) onTitleSave;

  final dynamic Function(String) onContentSave;

  @override
  String toString() {
    return 'NoteRouteArgs{key: $key, id: $id, title: $title, content: $content, onTitleSave: $onTitleSave, onContentSave: $onContentSave}';
  }
}
