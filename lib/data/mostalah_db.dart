import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MostalahDb{

  Future<void> initializeDb() async {

    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
            // "CREATE TABLE terms(id INTEGER PRIMARY KEY, egyptianTerm TEXT, syrianTerm TEXT)");
            "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
      },
      version: 1,
    );
  }
  Future<void> insertDog(Future<Database> database,Dog dog) async {
    final Database db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs(Future<Database> database) async {
    final Database db = await database;

    //Query the table for all the dogs
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    //convert the list of Map<String, dynamic> to a List<Dog>
    return List.generate(maps.length, (index) {
      return Dog(
        id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age'],
      );
    });
  }

  Future<void> updateDogs(Future<Database> database,Dog dog) async {
    final Database db = await database;

    //update the given dog
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(Future<Database> database,int id) async {
    final Database db = await database;

    db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // var dogsList = await dogs();
  // for (var i = 0; i < dogsList.length; i++) {
  // print(dogsList[i]);
  // }
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}