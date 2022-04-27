import 'package:find_thing/injector.dart';
import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/presentation/cubits/area_cubit/area_cubit.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlaceCubit placeCubit = GetIt.I();
    GetIt.I<ObjectBoxDatabase>().create().then((value) => placeCubit.getPlaces());

    AppRouter router = GetIt.I();

    return MultiBlocProvider(
      providers: [
        BlocProvider<PermissionCubit>(
          create: (context) => GetIt.I(),
        ),
        BlocProvider<ImageCubit>(
          create: (context) => GetIt.I(),
        ),
        BlocProvider<PlaceCubit>(
          create: (context) => placeCubit,
        ),
        BlocProvider<AreaCubit>(
          create: (context) => GetIt.I(),
        ),
      ],
      child: MaterialApp.router(
        title: "Find things",
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
