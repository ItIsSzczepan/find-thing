import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/data/repositories/database_reposiotry_impl.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../models.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  late final DatabaseRepositoryImpl databaseRepositoryImpl;
  late final ObjectBoxDatabase objectBoxDatabase;
  late Place testPlace;
  
  setUpAll(() async {
    objectBoxDatabase = ObjectBoxDatabase();
    await objectBoxDatabase.create(test: true);
    databaseRepositoryImpl = DatabaseRepositoryImpl(objectBoxDatabase);
  });

  group("createNewPlace", (){
    test("createNewPlace should return user with id, uid and without fileLocation", ()async{
      String testPlaceName = "test place";

      final Place result = await databaseRepositoryImpl.createNewPlace(name: testPlaceName);

      expect(result.name, testPlaceName);
      expect(result.id, isNotNull);
      expect(result.uid, isNotNull);
      expect(result.fileLocation, isNull);

      testPlace = result;
    });

    test("createNewPlace should save Place in db", ()async{
      String testPlaceName = TestModels().examplePlaceName;

      final Place result = await databaseRepositoryImpl.createNewPlace(name: testPlaceName);
      final Place fromDB = await objectBoxDatabase.placeDao.get(result.id);

      expect(result.id, fromDB.id);
    });
  });

  group("savePlace", (){
    test("savePlace should save Place in db", () async {
      // change sth in object
      testPlace.name = "updated place";

      await databaseRepositoryImpl.savePlace(testPlace);

      final fromDB = await objectBoxDatabase.placeDao.get(testPlace.id);
      expect(testPlace.name, fromDB.name);
    });

    test("savePlace should can't save Place with changed uid", () async {
      Place wrongPlace = testPlace;
      wrongPlace.uid = "5125132";
      expect(() => databaseRepositoryImpl.savePlace(wrongPlace), throwsA(isA<Exception>()));
    });
  });

  group("removePlace", (){
    test("removePlace should remove place from DB", () async {
      final result = await databaseRepositoryImpl.removePlace(testPlace.id);

      final fromDB = await objectBoxDatabase.placeDao.get(testPlace.id);
      expect(result, true);
      expect(fromDB, null);
    });

    test("savePlace should can't remove place that is not in DB", () async {
      final result = await databaseRepositoryImpl.removePlace(testPlace.id);

      final Place? fromDB = await objectBoxDatabase.placeDao.get(testPlace.id);
      expect(fromDB, null);
      expect(result, false);
    });
  });
}