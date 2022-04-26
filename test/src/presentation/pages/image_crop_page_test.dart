
import 'package:bloc_test/bloc_test.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MockImageCubit extends MockCubit<ImageCubitState> implements ImageCubit {
  @override
  ImageCubitState get state => ImageCubitState.empty();
  @override
  retrieveImage() {}
}
class MockPlaceCubit extends MockCubit<PlaceCubitState> implements PlaceCubit {
  @override
  PlaceCubitState get state => PlaceCubitState.data(stream: Stream.empty());
}
class MockPermissionCubit extends MockCubit<PermissionCubitState> implements PermissionCubit {
  @override
  PermissionCubitState get state => const PermissionCubitState.data(permissions: {Permissions.file: PermissionStatus.granted});
  @override
  Future<void> checkFile() async {}
}

void main(){
  late MockImageCubit imageCubit;
  late AppRouter router;

  setUp((){
    imageCubit = MockImageCubit();
  });

  initPage(WidgetTester tester) async {
    router = AppRouter();

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<PermissionCubit>(create: (_) => MockPermissionCubit()),
          BlocProvider<PlaceCubit>(create: (_) => MockPlaceCubit()),
          BlocProvider<ImageCubit>(
            create: (context) => imageCubit,
          ),
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    router.navigate(MainImageCropRoute(children: [ImageCropRoute(file: XFile(""))]));
  }

  group("check ui displaying",(){
    testWidgets("app bar", (WidgetTester tester)async{
      await initPage(tester);
      try {
        await tester.pumpAndSettle(Duration(seconds: 1));
      }catch (e){}

      final appBar = find.byType(AppBar);
      final title = find.text(AppLocalizationsEn().cropImageTitle);

      expect(appBar, findsOneWidget);
      expect(title, findsOneWidget);
    });

    testWidgets("buttons", (WidgetTester tester)async{
      await initPage(tester);
      try {
        await tester.pumpAndSettle(Duration(seconds: 1));
      }catch (e){}

      final cropButton = find.text(AppLocalizationsEn().crop);
      final cancelButton = find.text(AppLocalizationsEn().cancel);

      expect(cropButton, findsOneWidget);
      expect(cancelButton, findsOneWidget);
    });
  });

  group("interactions", (){
    testWidgets("tap cancel should pop screen", (WidgetTester tester)async{
      await initPage(tester);
      try {
        await tester.pumpAndSettle(Duration(seconds: 1));
      }catch (e){}

      final cancelButton = find.text(AppLocalizationsEn().cancel);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();

      expect(router.current.name, "PlacesListRoute");
    });

    // TODO: transfer to integration test
    testWidgets("tap crop should push setName screen", (WidgetTester tester)async{
      await initPage(tester);
      try {
        await tester.pumpAndSettle(Duration(seconds: 1));
      }catch (e){}

      final cropButton = find.text(AppLocalizationsEn().crop);
      await tester.tap(cropButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(router.current.name, "SetNameRoute");
    }, skip: true);
  });
}