import 'package:find_thing/src/core/navigation.dart';
import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/data/data_sources/permission_service.dart';
import 'package:find_thing/src/data/repositories/database_reposiotry_impl.dart';
import 'package:find_thing/src/data/repositories/file_repository_impl.dart';
import 'package:find_thing/src/data/repositories/permission_reposiotry_impl.dart';
import 'package:find_thing/src/domain/repositories/database_repository.dart';
import 'package:find_thing/src/domain/repositories/file_repository.dart';
import 'package:find_thing/src/domain/repositories/permission_repository.dart';
import 'package:find_thing/src/domain/use_cases/check_and_ask_permission_use_case.dart';
import 'package:find_thing/src/domain/use_cases/edit_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/get_places_use_case.dart';
import 'package:find_thing/src/domain/use_cases/open_settings_use_case.dart';
import 'package:find_thing/src/domain/use_cases/remove_area_use_case.dart';
import 'package:find_thing/src/domain/use_cases/remove_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/retrieve_lost_image_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_area_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/user_pick_image_use_case.dart';
import 'package:find_thing/src/presentation/cubits/area_cubit/area_cubit.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:find_thing/src/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:find_thing/src/presentation/cubits/place_cubit/place_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

void initInjector(){
  // SERVICES
  GetIt.I.registerSingleton<ObjectBoxDatabase>(ObjectBoxDatabase());
  GetIt.I.registerSingleton<PermissionsService>(PermissionsService());
  GetIt.I.registerSingleton<ImagePicker>(ImagePicker());

  // REPOSITORIES
  GetIt.I.registerSingleton<DatabaseRepository>(DatabaseRepositoryImpl(GetIt.I()));
  GetIt.I.registerSingleton<FileRepository>(FileRepositoryImpl(GetIt.I()));
  GetIt.I.registerSingleton<PermissionRepository>(PermissionRepositoryImpl(GetIt.I()));

  // USE CASES
  // Permission
  GetIt.I.registerSingleton<CheckAndAskPermissionUseCase>(CheckAndAskPermissionUseCase(GetIt.I()));
  GetIt.I.registerSingleton<OpenSettingsUseCase>(OpenSettingsUseCase(GetIt.I()));
  // Image Picking
  GetIt.I.registerSingleton<RetrieveLostImageUseCase>(RetrieveLostImageUseCase(GetIt.I()));
  GetIt.I.registerSingleton<UserPickImageUseCase>(UserPickImageUseCase(GetIt.I()));
  GetIt.I.registerSingleton<SavePlaceUseCase>(SavePlaceUseCase(GetIt.I(), GetIt.I()));
  // Place
  GetIt.I.registerSingleton<EditPlaceUseCase>(EditPlaceUseCase(GetIt.I()));
  GetIt.I.registerSingleton<RemovePlaceUseCase>(RemovePlaceUseCase(GetIt.I()));
  GetIt.I.registerSingleton<GetPlacesUseCase>(GetPlacesUseCase(GetIt.I()));
  // Area
  GetIt.I.registerSingleton<SaveAreaUseCase>(SaveAreaUseCase(GetIt.I()));
  GetIt.I.registerSingleton<RemoveAreaUseCase>(RemoveAreaUseCase(GetIt.I()));

  // BLOCs/CUBITs
  GetIt.I.registerFactory<AreaCubit>(() => AreaCubit(GetIt.I(), GetIt.I(), GetIt.I()));
  GetIt.I.registerFactory<ImageCubit>(() => ImageCubit(GetIt.I(), GetIt.I(), GetIt.I()));
  GetIt.I.registerFactory<PermissionCubit>(() => PermissionCubit(GetIt.I(), GetIt.I()));
  GetIt.I.registerFactory<PlaceCubit>(() => PlaceCubit(GetIt.I(), GetIt.I(), GetIt.I())..getPlaces());

  // ROUTER
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
}