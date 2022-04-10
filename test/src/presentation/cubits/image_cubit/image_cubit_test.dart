import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:find_thing/src/domain/use_cases/retrieve_lost_image_use_case.dart';
import 'package:find_thing/src/domain/use_cases/save_place_use_case.dart';
import 'package:find_thing/src/domain/use_cases/user_pick_image_use_case.dart';
import 'package:find_thing/src/presentation/cubits/image_cubit/image_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_cubit_test.mocks.dart';

@GenerateMocks(
    [UserPickImageUseCase, RetrieveLostImageUseCase, SavePlaceUseCase])
void main() {
  late MockUserPickImageUseCase userPickImageUseCase;
  late MockRetrieveLostImageUseCase retrieveLostImageUseCase;
  late MockSavePlaceUseCase savePlaceUseCase;
  late ImageCubit imageCubit;

  setUp(() {
    userPickImageUseCase = MockUserPickImageUseCase();
    retrieveLostImageUseCase = MockRetrieveLostImageUseCase();
    savePlaceUseCase = MockSavePlaceUseCase();
    imageCubit = ImageCubit(
        userPickImageUseCase, retrieveLostImageUseCase, savePlaceUseCase);
  });

  test("cubit should return initial state at beginning", () {
    expect(imageCubit.state, isA<ImageInitial>());
  });

  blocTest<ImageCubit, ImageCubitState>('bloc should return file if was picked',
      setUp: () => when(userPickImageUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => Right(XFile(''))),
      build: () => imageCubit,
      act: (cubit) => cubit.pickImage(ImageSource.gallery),
      expect: () => [isA<ImagePicked>()],
      verify: (_) {
        verify(userPickImageUseCase(params: ImageSource.gallery));
        verifyZeroInteractions(retrieveLostImageUseCase);
        verifyZeroInteractions(savePlaceUseCase);
      });

  blocTest<ImageCubit, ImageCubitState>(
      "bloc should return empty state if file wasn't picked",
      setUp: () => when(userPickImageUseCase(params: anyNamed('params')))
          .thenAnswer((realInvocation) async => const Right(null)),
      build: () => imageCubit,
      act: (cubit) => cubit.pickImage(ImageSource.gallery),
      expect: () => [isA<ImageEmpty>()],
      verify: (_) {
        verify(userPickImageUseCase(params: ImageSource.gallery));
        verifyZeroInteractions(retrieveLostImageUseCase);
        verifyZeroInteractions(savePlaceUseCase);
      });

  blocTest<ImageCubit, ImageCubitState>(
      'bloc should return file if was retrieved',
      setUp: () => when(retrieveLostImageUseCase())
          .thenAnswer((realInvocation) async => Right(XFile(''))),
      build: () => imageCubit,
      act: (cubit) => cubit.retrieveImage(),
      expect: () => [isA<ImagePicked>()],
      verify: (_) {
        verify(retrieveLostImageUseCase());
        verifyZeroInteractions(userPickImageUseCase);
        verifyZeroInteractions(savePlaceUseCase);
      });

  blocTest<ImageCubit, ImageCubitState>(
      "bloc should return nothing if file wasn't retrieved",
      setUp: () => when(retrieveLostImageUseCase())
          .thenAnswer((realInvocation) async => const Right(null)),
      build: () => imageCubit,
      act: (cubit) => cubit.retrieveImage(),
      expect: () => [],
      verify: (_) {
        verify(retrieveLostImageUseCase());
        verifyZeroInteractions(userPickImageUseCase);
        verifyZeroInteractions(savePlaceUseCase);
      });

  blocTest<ImageCubit, ImageCubitState>(
    "cubit should return empty after saving place",
    setUp: () => when(savePlaceUseCase(params: anyNamed('params'))).thenAnswer((realInvocation) async => const Right(true)),
    build: () => imageCubit,
    act: (cubit) async => cubit.savePlace(name: "test", image: await createTestImage()),
    expect: () => [isA<ImageEmpty>()],
      verify: (_) {
        verify(savePlaceUseCase(params: anyNamed('params')));
        verifyZeroInteractions(userPickImageUseCase);
        verifyZeroInteractions(retrieveLostImageUseCase);
      }
  );

  blocTest<ImageCubit, ImageCubitState>(
      "cubit shouldn't return empty if place wasn't save",
      setUp: () => when(savePlaceUseCase(params: anyNamed('params'))).thenAnswer((realInvocation) async => const Right(false)),
      build: () => imageCubit,
      act: (cubit) async => cubit.savePlace(name: "test", image: await createTestImage()),
      expect: () => [isA<ImageFailure>()],
      verify: (_) {
        verify(savePlaceUseCase(params: anyNamed('params')));
        verifyZeroInteractions(userPickImageUseCase);
        verifyZeroInteractions(retrieveLostImageUseCase);
      }
  );
}
