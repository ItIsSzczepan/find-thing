import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc_test/bloc_test.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/pages/set_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models.dart';

class MockImageCubit extends MockCubit<ImageCubitState> implements ImageCubit {
  @override
  ImageCubitState get state => const ImageCubitState.empty();

  @override
  retrieveImage() {}
}

class MockFunction extends Mock {
  void call(bool);
}

void main() async{
  late MockImageCubit mockImageCubit;
  late MockFunction mockFunction;
  final Uint8List imageData = Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  setUp(() {
    mockFunction = MockFunction();
    mockImageCubit = MockImageCubit();
  });

  initPage(WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider<ImageCubit>(
      create: (context) => mockImageCubit,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SetNamePage(
          imageDataList: imageData,
          onSuccess: mockFunction,
        ),
      ),
    ));

  }


  // First test always fail because of flutter bug
  group("ui", () {
    testWidgets("app bar", (WidgetTester tester) async{
      try{
        await initPage(tester);
      }catch (e){
        await initPage(tester);
      }

      final findAppBar = find.byType(AppBar);
      final findTitle = find.text(AppLocalizationsEn().setName);

      expect(findAppBar, findsOneWidget);
      expect(findTitle, findsOneWidget);
    });

    testWidgets("TextFiled", (WidgetTester tester) async{
      await initPage(tester);

      final findTextField = find.byType(TextField);

      expect(findTextField, findsOneWidget);
    });

    testWidgets("image", (WidgetTester tester) async{
      await initPage(tester);

      final findImage = find.byType(Image);

      expect(findImage, findsOneWidget);
    });

    testWidgets("save button", (WidgetTester tester) async{
      await initPage(tester);

      final findSaveButton = find.widgetWithText(Row, AppLocalizationsEn().save);

      expect(findSaveButton, findsOneWidget);
    });
  }, skip: true);
}
