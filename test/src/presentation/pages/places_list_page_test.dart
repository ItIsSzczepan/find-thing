import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../models.dart';

class MockPermissionCubit extends MockCubit<PermissionCubitState>
    implements PermissionCubit {}

class MockImageCubit extends MockCubit<ImageCubitState> implements ImageCubit {}

class MockPlaceCubit extends MockCubit<PlaceCubitState> implements PlaceCubit {
  ObjectBoxDatabase objectBoxDatabase;

  MockPlaceCubit(this.objectBoxDatabase);

  @override
  edit(Place place) {
    objectBoxDatabase.placeDao.save(place);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockImageCubit imageCubit;
  late MockPlaceCubit placeCubit;
  late PermissionCubit permissionCubit;
  late AppRouter router;
  late ObjectBoxDatabase objectBoxDatabase;

  setUpAll(() async {
    objectBoxDatabase = ObjectBoxDatabase();
    await objectBoxDatabase.create(test: true);
    if (objectBoxDatabase.placeDao.getAll().isEmpty) {
      objectBoxDatabase.placeDao.save(TestModels().examplePlace);
    }
  });

  tearDownAll(() {
    objectBoxDatabase.dispose();
  });

  initPage(WidgetTester tester) async {
    router = AppRouter();

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<PermissionCubit>(
            create: (context) => permissionCubit,
          ),
          BlocProvider<ImageCubit>(
            create: (context) => imageCubit,
          ),
          BlocProvider<PlaceCubit>(create: (_) => placeCubit, lazy: false,)
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),
        ),
      ),
    );
  }

  initWhenMocks() {
    imageCubit = MockImageCubit();
    placeCubit = MockPlaceCubit(objectBoxDatabase);
    permissionCubit = MockPermissionCubit();

    when(() => permissionCubit.checkFile())
        .thenAnswer((realInvocation) async => {
              permissionCubit.emit(const PermissionCubitState.data(
                  permissions: {Permissions.file: PermissionStatus.granted}))
            });
    when(() => imageCubit.retrieveImage()).thenAnswer((realInvocation) async =>
        imageCubit.emit(const ImageCubitState.empty()));
    when(() => permissionCubit.state)
        .thenReturn(const PermissionCubitState.initial());
    when(() => imageCubit.state).thenReturn(const ImageCubitState.initial());
    when(() => placeCubit.state).thenReturn(PlaceCubitState.data(
        stream: objectBoxDatabase.placeDao.allPlacesStream));
  }

  group("check ui displaying", () {
    testWidgets("title should be displayed", (WidgetTester tester) async {
      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      expect(find.text(AppLocalizationsEn().title), findsOneWidget);
    });

    testWidgets("fab should be displayed", (WidgetTester tester) async {
      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets("fab should expand options", (WidgetTester tester) async {
      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      //act
      final fab = find.byIcon(Icons.add);
      await tester.tap(fab);
      await tester.pump(const Duration(seconds: 1));

      final buttonWithGalleryIcon = find.byIcon(Icons.collections);
      final buttonWithCameraIcon = find.byIcon(Icons.camera_alt);

      //expect
      expect(buttonWithGalleryIcon, findsOneWidget);
      expect(buttonWithCameraIcon, findsOneWidget);
      debugPrint(permissionCubit.state.toString());
      debugPrint(imageCubit.state.toString());

      //close menu before terminating app, prevents bug from package
      await tester.tap(fab.first);
      await tester.pump();
    });
  });

  group("permission cubit interactions", () {
    testWidgets("page should ask for permission on init",
        (WidgetTester tester) async {
      initWhenMocks();
      when(() => permissionCubit.checkFile())
          .thenAnswer((realInvocation) async {
        permissionCubit.emit(const PermissionCubitState.data(
            permissions: {Permissions.file: PermissionStatus.granted}));
      });
      await initPage(tester);
      await tester.pumpAndSettle();

      verify(() => permissionCubit.checkFile()).called(1);
    });

    testWidgets(
        "page should redirect to permission page if permission wasn't granted",
        (WidgetTester tester) async {
      initWhenMocks();
      whenListen(
          permissionCubit,
          Stream.fromIterable([
            const PermissionCubitState.initial(),
            const PermissionCubitState.data(
                permissions: {Permissions.file: PermissionStatus.denied})
          ]));
      when(() => permissionCubit.checkFile())
          .thenAnswer((realInvocation) async {
        when(() => permissionCubit.state).thenReturn(
            const PermissionCubitState.data(
                permissions: {Permissions.file: PermissionStatus.denied}));
      });

      await initPage(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //verify
      verify(() => permissionCubit.checkFile()).called(1);

      expect(permissionCubit.state, isA<PermissionData>());
      expect((router.current.args as PermissionRouteArgs).onSuccess, isA<Function>());
      expect(router.current.name, PermissionRoute.name);
    });
  });

  group("image cubit interactions", () {
    testWidgets("page should redirect if image cubit retrieve lost file",
        (WidgetTester tester) async {
      initWhenMocks();
      whenListen(imageCubit, Stream.fromIterable([const ImageCubitState.initial(), ImageCubitState.picked(XFile(""))]));

      await initPage(tester);
      try {
        await tester.pumpAndSettle();
      }catch(e){}
      // verify
      verify(() => imageCubit.retrieveImage()).called(1);

      expect(router.current.path, '/imageCrop');
        });

    testWidgets(
        "page shouldn't redirect if image cubit didn't retrieve lost file",
        (WidgetTester tester) async {
      initWhenMocks();
      whenListen(imageCubit, Stream.fromIterable([const ImageCubitState.initial(), const ImageCubitState.empty()]));


      await initPage(tester);
      await tester.pumpAndSettle();

      // verify
      verify(() => imageCubit.retrieveImage()).called(1);

      expect(router.current.name, PlacesListRoute.name);
    });

    testWidgets(
        "page should redirect to crop image page after selecting image from gallery",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      StreamController<ImageCubitState> controller = StreamController<ImageCubitState>()..add(const ImageCubitState.empty());
      whenListen(imageCubit, controller.stream, initialState: const ImageCubitState.initial());

      await initPage(tester);
      await tester.pump();
      // act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.collections));
      controller.add(ImageCubitState.picked(XFile("")));
      try {
        await tester.pumpAndSettle();
      }catch(e){}

      // verify
      verify(() => imageCubit.pickImage(ImageSource.gallery)).called(1);

      expect(router.current.name, MainImageCropRoute.name);
    });

    testWidgets("page shouldn't redirect if image wasn't selected from gallery",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      StreamController<ImageCubitState> controller = StreamController<ImageCubitState>()..add(const ImageCubitState.empty());
      whenListen(imageCubit, controller.stream, initialState: const ImageCubitState.initial());


      await initPage(tester);
      await tester.pump();

      // act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.collections));
      controller.add(const ImageCubitState.empty());
      await tester.pumpAndSettle();

      // verify
      verify(() => imageCubit.pickImage(ImageSource.gallery)).called(1);

      expect(router.current.name, PlacesListRoute.name);
    });

    testWidgets(
        "page should redirect to crop image page after take image from camera",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      StreamController<ImageCubitState> controller = StreamController<ImageCubitState>()..add(const ImageCubitState.empty());
      whenListen(imageCubit, controller.stream, initialState: const ImageCubitState.initial());

      await initPage(tester);
      await tester.pump();

      // act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.camera_alt));
      controller.add(ImageCubitState.picked(XFile("")));
      try {
        await tester.pumpAndSettle();
      }catch(e){}

      // verify
      verify(() => imageCubit.pickImage(ImageSource.camera)).called(1);

      expect(router.current.name, MainImageCropRoute.name);
    });

    testWidgets("page shouldn't redirect if image wasn't taken from camera",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      StreamController<ImageCubitState> controller = StreamController<ImageCubitState>()..add(const ImageCubitState.empty());
      whenListen(imageCubit, controller.stream, initialState: const ImageCubitState.initial());


      await initPage(tester);
      await tester.pump();

      // act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.camera_alt));
      controller.add(const ImageCubitState.empty());
      await tester.pumpAndSettle();

      // verify
      verify(() => imageCubit.pickImage(ImageSource.camera)).called(1);

      expect(router.current.name, PlacesListRoute.name);
    });
  });

  group("place cubit interactions", () {
    testWidgets("page should display text when no places",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      when(() => placeCubit.state).thenReturn(
          const PlaceCubitState.data(stream: Stream<Query<Place>>.empty()));
      await initPage(tester);
      await tester.pumpAndSettle();

      // expect
      expect(find.text(AppLocalizationsEn().emptyPlacesText), findsOneWidget);
    });

    testWidgets("page should display places list", (WidgetTester tester) async {
      // init
      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      // expect
      expect(find.text(AppLocalizationsEn().emptyPlacesText), findsNothing);
      expect(find.byType(PlaceTile), findsWidgets);
    });

    testWidgets("page should redirect after tap on place tile",
        (WidgetTester tester) async {
      // init
      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      // act
      Place firstPlace = objectBoxDatabase.placeDao.getAll().first;
      final firstPlaceTileTitle = find.text(firstPlace.name);
      await tester.tap(firstPlaceTileTitle.first);
      await tester.pumpAndSettle();

      expect(router.current.name, MainPlaceRoute.name);
    });

    // TODO: transfer to integration test
    testWidgets("page should updated place title after renaming",
        (WidgetTester tester) async {
      // init
      Place firstPlaceBeforeAct = objectBoxDatabase.placeDao.getAll().first;
      String newTitle = const Uuid().v1();

      initWhenMocks();
      await initPage(tester);
      await tester.pumpAndSettle();

      // ACT
      // open place menu
      final firstPlaceTileText = find.text(firstPlaceBeforeAct.name);
      await tester.longPress(firstPlaceTileText.first);
      await tester.pump(const Duration(seconds: 2));
      // tap rename button
      final renameButtonIcon = find.byIcon(Icons.drive_file_rename_outline);
      await tester.tap(renameButtonIcon);
      await tester.pump();
      // enter new name
      final findTextField = find.byType(TextField);
      await tester.enterText(findTextField, newTitle);
      await tester.pump();
      // accept
      final findRenameAlertButton = find.widgetWithText(TextButton, AppLocalizationsEn().rename);
      await tester.tap(findRenameAlertButton);
      await tester.pump();

      final findNewTitle = find.widgetWithText(PlaceTile, newTitle);
      Place firstPlaceAfterAct = objectBoxDatabase.placeDao.getAll().first;

      // expect
      expect(firstPlaceBeforeAct.name, isNot(firstPlaceAfterAct.name));
      expect(findNewTitle, findsOneWidget);
      verify(() => placeCubit.edit(firstPlaceBeforeAct));
    }, skip: true);

    // TODO: transfer to integration test
    testWidgets("page should remove deleted Place from list",
        (WidgetTester tester) async {
      // init
      List<Place> allPlacesBeforeAct = objectBoxDatabase.placeDao.getAll();
      Place firstPlace = allPlacesBeforeAct.first;

      initWhenMocks();
      await initPage(tester);
      await tester.pump();
      when(() => placeCubit.remove(firstPlace.id)).thenAnswer((realInvocation) =>
          objectBoxDatabase.placeDao
              .remove(realInvocation.positionalArguments.first));

      // ACT
      // open place menu
      final firstPlaceTileText = find.text(firstPlace.name);
      await tester.longPress(firstPlaceTileText);
      await tester.pump(const Duration(seconds: 2));
      // tap rename button
      final removeButtonText = find.textContaining(AppLocalizationsEn().remove);
      await tester.tap(removeButtonText);
      await tester.pump();
      // accept
      final findRemoveAlertButton = find.text(AppLocalizationsEn().remove);
      await tester.tap(findRemoveAlertButton);
      await tester.pump(Duration.zero, EnginePhase.flushSemantics);


      final findNewTitle = find.widgetWithText(PlaceTile, firstPlace.name);
      List<Place> allPlacesAfterAct = objectBoxDatabase.placeDao.getAll();

      // expect
      expect(allPlacesBeforeAct.length, allPlacesAfterAct.length + 1);
      expectLater(findNewTitle, findsNothing);
      verify(() => placeCubit.remove(firstPlace.id));
    }, skip: true);
  });
}
