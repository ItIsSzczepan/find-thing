import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/pages/permission_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubits/permission_cubit/permissions_cubit_test.mocks.dart';

class MyFunctions {
  onSuccess() {}
}

class MockFunction extends Mock implements MyFunctions {}

@GenerateMocks([CheckAndAskPermissionUseCase])
void main() {
  late MockCheckAndAskPermissionUseCase permissionUseCase;
  late PermissionCubit permissionCubit;

  setUpAll(() {
    permissionUseCase = MockCheckAndAskPermissionUseCase();
    permissionCubit = PermissionCubit(permissionUseCase);
    GetIt.I.registerFactory<PermissionCubit>(() => permissionCubit);
  });

  testWidgets("check if button is showing", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: PermissionPage(
          onSuccess: () {},
        )));

    expect(
        find.widgetWithText(
            TextButton, AppLocalizationsEn().permissionPageButton),
        findsOneWidget);
    expect(find.text(AppLocalizationsEn().permissionPageText), findsOneWidget);
    expect(find.byIcon(Icons.folder), findsOneWidget);
  });

  testWidgets("check if button execute function on success",
      (WidgetTester tester) async {
    when(permissionUseCase(params: Permissions.file)).thenAnswer(
        (realInvocation) async => const Right(PermissionStatus.granted));
    // prepare
    final functions = MockFunction();
    when(functions.onSuccess()).thenReturn(null);
    await tester.pumpWidget(MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: PermissionPage(
          onSuccess: functions.onSuccess,
        )));

    // act
    final findButton = find.text(AppLocalizationsEn().permissionPageButton);
    await tester.tap(findButton);
    await tester.pump();

    // expect
    verify(functions.onSuccess()).called(1);
  });
}
