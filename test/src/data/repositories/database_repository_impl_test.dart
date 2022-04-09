import 'package:find_thing/src/data/data_sources/objectbox_database.dart';
import 'package:find_thing/src/data/repositories/database_reposiotry_impl.dart';
import 'package:find_thing/src/domain/entities/area.dart';
import 'package:find_thing/src/domain/entities/place.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

import '../../../models.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  late final DatabaseRepositoryImpl databaseRepositoryImpl;
  late final ObjectBoxDatabase objectBoxDatabase;
  late Place testPlace;
  late Area testArea;
  
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

  group("saveArea", (){
    test("saveArea should save area in db", () async{
      Area newArea = Area(content: "test");
      newArea.place.target = testPlace;

      final resultId = await databaseRepositoryImpl.saveArea(newArea);
      final Area areaFromDB = await objectBoxDatabase.areaDao.get(resultId);

      expect(areaFromDB.content, newArea.content);
      testArea = areaFromDB;
    });

    test("saveArea should can't save Area without place", ()async{
      Area newArea = Area(content: "test");
      expect(() => databaseRepositoryImpl.saveArea(newArea), throwsA(isA<Exception>()));
    });
  });

  group("getPlacesStream", (){
    test("getPlacesStream should return stream", ()async{
      final result = await databaseRepositoryImpl.getPlacesStream();

      expect(result, isA<Stream>());
    });

    test("stream should update after adding object", ()async{
      final result = await databaseRepositoryImpl.getPlacesStream();
      List<int> counts = [];

      final sub = result.listen((event) {
        counts.add((event as Query<Place>).count());
      });

      await objectBoxDatabase.placeDao.save(Place(name: const Uuid().v1()));
      await objectBoxDatabase.placeDao.save(Place(name: const Uuid().v1()));
      await Future.delayed(const Duration(seconds: 1));
      expect(counts.last, counts.first + 1);
      sub.cancel();
    });
  });

  group("removeArea", (){
    test("removeArea should remove area from db", ()async{
      final result = await databaseRepositoryImpl.removeArea(testArea.id);
      final fromDB = await objectBoxDatabase.areaDao.get(testArea.id);

      expect(result, true);
      expect(fromDB, null);
    });

    test("removeArea shouldn't remove place that is not in DB", () async {
      final result = await databaseRepositoryImpl.removeArea(testArea.id);
      final Area? fromDB = await objectBoxDatabase.areaDao.get(testArea.id);

      expect(fromDB, null);
      expect(result, false);
    });
  });

  group("removePlace", (){
    Future<int> addPlaceToDb() async {
      Place newPlace = await databaseRepositoryImpl.createNewPlace(name: "new place");
      newPlace.areas.add(Area());
      newPlace.areas.add(Area());
      return await databaseRepositoryImpl.savePlace(newPlace);
    }

    test("removePlace should remove place from DB", () async {
      final result = await databaseRepositoryImpl.removePlace(testPlace.id);

      final fromDB = await objectBoxDatabase.placeDao.get(testPlace.id);
      expect(result, true);
      expect(fromDB, null);
    });

    test("removePlace should remove areas related to place", () async {
      int testPlaceId = await addPlaceToDb();
      final Place testPlace = await objectBoxDatabase.placeDao.get(testPlaceId);

      List<int> areasIds = testPlace.areas.map((element) => element.id).toList();

      final result = await databaseRepositoryImpl.removePlace(testPlace.id);

      expect(result, true);
      for(int id in areasIds){
        Area? dbId = await objectBoxDatabase.areaDao.get(id);
        expect(dbId, null);
      }
    });

    test("removePlace shouldn't remove place that is not in DB", () async {
      final result = await databaseRepositoryImpl.removePlace(testPlace.id);

      final Place? fromDB = await objectBoxDatabase.placeDao.get(testPlace.id);
      expect(fromDB, null);
      expect(result, false);
    });
  });

  tearDownAll((){
    objectBoxDatabase.dispose();
  });
}