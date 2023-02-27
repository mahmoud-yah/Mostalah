import 'dart:io';

import 'package:mostalah/data/constants.dart';
import 'package:mostalah/models/term.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  // "$idColumn INTEGER PRIMARY KEY AUTOINCREMENT,"
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $termTable ("
          "$idColumn TEXT PRIMARY KEY,"
          "$syrianTermColumn TEXT,"
          "$egyptianTermColumn TEXT,"
          "$termDescriptionColumn TEXT,"
          "$favoriteColumn BIT"
          ")");
    });
  }

  Future<void> insertTerm(Term term) async {
    var db = await database;
    await db!.insert(
      termTable,
      term.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //
  updateTerm(Term term) async {
    var db = await database;
    await db!.update(
      termTable,
      term.toMap(),
      where: '$idColumn = ?',
      whereArgs: [term.id],
    );
  }

  getTerm(int id) async {
    var db = await database;
    var res = await db!.query(
      termTable,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return Term.fromMap(res.first);
  }

  getAllTerms() async {
    final db = await database;
    var res = await db!.query(termTable);
    List<Term> list =
        res.isNotEmpty ? res.map((c) => Term.fromMap(c)).toList() : [];
    return list;
  }

  getFavoriteTerms() async {
    final db = await database;
    var res =
        await db!.rawQuery("SELECT * FROM $termTable WHERE $favoriteColumn=1");
    List<Term> list =
        res.isNotEmpty ? res.map((c) => Term.fromMap(c)).toList() : [];
    return list;
  }

  toggleFavorite(Term term) async {
    final db = await database;
    Term fav = Term(
      id: term.id,
      egyptianTerm: term.egyptianTerm,
      syrianTerm: term.syrianTerm,
      termDescription: term.termDescription,
      isFavorite: !term.isFavorite,
    );
    print('isfavorite: ${fav.isFavorite}');
    var res = await db!.update(termTable, fav.toMap(),
        where: "$idColumn = ?", whereArgs: [fav.id]);
    print('res: $res');
    return res;
  }

  deleteTerm(int id) async {
    final db = await database;
    db!.delete(termTable, where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db!.rawDelete("Delete from $termTable");
  }
}
