import 'package:find_thing/objectbox.g.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:find_thing/src/presentation/widgets/place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/go_route_match.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../models.dart';
import 'places_list_page_test.mocks.dart';

@GenerateMocks([ImageCubit, PlaceCubit, PermissionCubit])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final MockImageCubit imageCubit;
  late final MockPlaceCubit placeCubit;
  late final PermissionCubit permissionCubit;
  late GoRouter router;
  late ObjectBoxDatabase objectBoxDatabase;

  setUpAll(() {
    objectBoxDatabase = ObjectBoxDatabase()..create(test: true);
    if (objectBoxDatabase.placeDao.getAll().isEmpty) {
      objectBoxDatabase.placeDao.save(TestModels().examplePlace);
    }

    imageCubit = MockImageCubit();
    placeCubit = MockPlaceCubit();
    permissionCubit = MockPermissionCubit();

    GetIt.I.registerFactory<ImageCubit>(() => imageCubit);
    GetIt.I.registerFactory<PlaceCubit>(() => placeCubit);
    GetIt.I.registerFactory<PermissionCubit>(() => permissionCubit);
  });

  tearDownAll(() {
    objectBoxDatabase.dispose();
  });

  initPage(WidgetTester tester) async {
    router = GoRouter(initialLocation: "/", routes: routes);

    await tester.pumpWidget(MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    ));
  }

  initWhenMocks() {
    when(permissionCubit.checkFile()).thenAnswer((realInvocation) async {
      permissionCubit.emit(const PermissionCubitState.data(
          permissions: {Permissions.file: PermissionStatus.granted}));
    });
    when(imageCubit.retrieveImage()).thenAnswer(
        (realInvocation) => imageCubit.emit(const ImageCubitState.empty()));
    when(placeCubit.state).thenReturn(PlaceCubitState.data(
        stream: objectBoxDatabase.placeDao.allPlacesStream));
  }

  group("check ui displaying", () {
    testWidgets("title should be displayed", (WidgetTester tester) async {
      await initPage(tester);

      expect(find.text(AppLocalizationsEn().title), findsOneWidget);
    });

    testWidgets("fab should be displayed", (WidgetTester tester) async {
      await initPage(tester);

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets("fab should expand options", (WidgetTester tester) async {
      await initPage(tester);

      //act
      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);
      await tester.pump();

      final buttonWithGalleryIcon = find.byIcon(Icons.browse_gallery);
      final buttonWithCameraIcon = find.byIcon(Icons.camera_alt);

      //expect
      expect(buttonWithGalleryIcon, findsOneWidget);
      expect(buttonWithCameraIcon, findsOneWidget);
    });
  });

  group("permission cubit interactions", () {
    testWidgets("page should ask for permission on init",
        (WidgetTester tester) async {
      when(permissionCubit.checkFile()).thenAnswer((realInvocation) async {
        permissionCubit.emit(const PermissionCubitState.data(
            permissions: {Permissions.file: PermissionStatus.granted}));
      });

      await initPage(tester);

      verify(permissionCubit.checkFile()).called(1);
    });

    testWidgets(
        "page should redirect to permission page if permission wasn't granted",
        (WidgetTester tester) async {
      when(permissionCubit.checkFile()).thenAnswer((realInvocation) async {
        permissionCubit.emit(const PermissionCubitState.data(
            permissions: {Permissions.file: PermissionStatus.denied}));
      });

      await initPage(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //verify
      verify(permissionCubit.checkFile()).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.extra, isA<Function>());
      expect(matches.first.fullpath, "/permission");
    });
  });

  group("image cubit interactions", () {
    testWidgets("page should redirect if image cubit retrieve lost file",
        (WidgetTester tester) async {
      when(permissionCubit.checkFile()).thenAnswer((realInvocation) async {
        permissionCubit.emit(const PermissionCubitState.data(
            permissions: {Permissions.file: PermissionStatus.granted}));
      });
      when(imageCubit.retrieveImage()).thenAnswer((realInvocation) =>
          imageCubit.emit(ImageCubitState.picked(XFile(""))));

      await initPage(tester);
      await tester.pumpAndSettle();

      // verify
      verify(imageCubit.retrieveImage()).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.extra, isA<XFile>());
      expect(matches.first.fullpath, "/imageCrop");
    });

    testWidgets(
        "page shouldn't redirect if image cubit didn't retrieve lost file",
        (WidgetTester tester) async {
      when(permissionCubit.checkFile()).thenAnswer((realInvocation) async {
        permissionCubit.emit(const PermissionCubitState.data(
            permissions: {Permissions.file: PermissionStatus.granted}));
      });
      when(imageCubit.retrieveImage()).thenAnswer(
          (realInvocation) => imageCubit.emit(const ImageCubitState.empty()));

      await initPage(tester);
      await tester.pump();

      // verify
      verify(imageCubit.retrieveImage()).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.fullpath, "/");
    });

    testWidgets(
        "page should redirect to crop image page after selecting image from gallery",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(imageCubit.pickImage(ImageSource.gallery)).thenAnswer(
          (realInvocation) =>
              imageCubit.emit(ImageCubitState.picked(XFile(""))));

      await initPage(tester);

      // act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.browse_gallery));
      await tester.pumpAndSettle();

      // verify
      verify(imageCubit.pickImage(ImageSource.gallery)).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.extra, isA<XFile>());
      expect(matches.first.fullpath, "/imageCrop");
    });

    testWidgets("page shouldn't redirect if image wasn't selected from gallery",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(imageCubit.pickImage(ImageSource.gallery)).thenAnswer(
          (realInvocation) async =>
              imageCubit.emit(const ImageCubitState.empty()));

      await initPage(tester);

      // act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.browse_gallery));
      await tester.pumpAndSettle();

      // verify
      verify(imageCubit.pickImage(ImageSource.gallery)).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.fullpath, "/");
    });

    testWidgets(
        "page should redirect to crop image page after take image from camera",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(imageCubit.pickImage(ImageSource.camera)).thenAnswer(
          (realInvocation) async =>
              imageCubit.emit(ImageCubitState.picked(XFile(""))));

      await initPage(tester);

      // act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();

      // verify
      verify(imageCubit.pickImage(ImageSource.camera)).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.extra, isA<XFile>());
      expect(matches.first.fullpath, "/imageCrop");
    });

    testWidgets("page shouldn't redirect if image wasn't taken from camera",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(imageCubit.pickImage(ImageSource.camera)).thenAnswer(
          (realInvocation) async =>
              imageCubit.emit(const ImageCubitState.empty()));

      await initPage(tester);

      // act
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();

      // verify
      verify(imageCubit.pickImage(ImageSource.camera)).called(1);

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches, hasLength(1));
      expect(matches.first.fullpath, "/");
    });
  });

  group("place cubit interactions", () {
    testWidgets("page should display text when no places",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(placeCubit.state).thenReturn(
          const PlaceCubitState.data(stream: Stream<Query<Place>>.empty()));
      initPage(tester);

      // expect
      expect(find.text(AppLocalizationsEn().emptyPlacesText), findsOneWidget);
    });

    testWidgets("page should display places list", (WidgetTester tester) async {
      // init
      initWhenMocks();
      initPage(tester);

      // expect
      expect(find.byType(PlaceTile), findsWidgets);
    });

    testWidgets("page should redirect after tap on place tile", (WidgetTester tester) async {
      // init
      initWhenMocks();
      initPage(tester);

      // act
      Place firstPlace = objectBoxDatabase.placeDao.getAll().first;
      final firstPlaceTileTitle = find.text(firstPlace.name);
      await tester.tap(firstPlaceTileTitle);
      await tester.pumpAndSettle();

      final List<GoRouteMatch> matches = router.routerDelegate.matches;
      expect(matches.first.extra, isA<Place>());
      expect(matches, hasLength(1));
      expect(matches.first.fullpath, "/place/${firstPlace.id}");
    });

    testWidgets("page should updated place title after renaming", (WidgetTester tester) async {
      // init
      Place firstPlace = objectBoxDatabase.placeDao.getAll().first;
      String newTitle = const Uuid().v1();

      initWhenMocks();
      initPage(tester);
      when(placeCubit.edit(firstPlace)).thenAnswer((realInvocation) => objectBoxDatabase.placeDao.save(realInvocation.positionalArguments.first));

      // ACT
      // open place menu
      final firstPlaceTileText = find.text(firstPlace.name);
      await tester.longPress(firstPlaceTileText);
      await tester.pump();
      // tap rename button
      final renameButtonText = find.textContaining(AppLocalizationsEn().rename);
      await tester.tap(renameButtonText);
      await tester.pump();
      // enter new name
      final findTextField = find.byType(TextField);
      await tester.enterText(findTextField, newTitle);
      await tester.pump();
      // accept
      final findRenameAlertButton = find.text(AppLocalizationsEn().rename);
      await tester.tap(findRenameAlertButton);
      await tester.pump();

      final findNewTitle = find.widgetWithText(PlaceTile, newTitle);

      // expect
      expect(findNewTitle, findsOneWidget);
      verify(placeCubit.edit(firstPlace));
    });

    testWidgets("page should remove deleted Place from list", (WidgetTester tester) async {
      // init
      Place firstPlace = objectBoxDatabase.placeDao.getAll().first;

      initWhenMocks();
      initPage(tester);
      when(placeCubit.remove(firstPlace.id)).thenAnswer((realInvocation) => objectBoxDatabase.placeDao.remove(realInvocation.positionalArguments.first));

      // ACT
      // open place menu
      final firstPlaceTileText = find.text(firstPlace.name);
      await tester.longPress(firstPlaceTileText);
      await tester.pump();
      // tap rename button
      final removeButtonText = find.textContaining(AppLocalizationsEn().remove);
      await tester.tap(removeButtonText);
      await tester.pump();
      // accept
      final findRemoveAlertButton = find.text(AppLocalizationsEn().remove);
      await tester.tap(findRemoveAlertButton);
      await tester.pump();

      final findNewTitle = find.widgetWithText(PlaceTile, firstPlace.name);

      // expect
      expect(findNewTitle, findsNothing);
      verify(placeCubit.remove(firstPlace.id));
    });
  });
}
