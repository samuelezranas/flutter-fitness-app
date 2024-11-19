import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoritesDbHelper {
  static final FavoritesDbHelper _instance = FavoritesDbHelper._internal();
  factory FavoritesDbHelper() => _instance;
  FavoritesDbHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            trainingId TEXT NOT NULL,
            trainingName TEXT NOT NULL,
            trainingImage TEXT NOT NULL
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> addFavorite(Map<String, dynamic> favorite) async {
    final db = await database;
    return db.insert('favorites', favorite);
  }

  Future<int> removeFavorite(String trainingId) async {
    final db = await database;
    return db.delete('favorites', where: 'trainingId = ?', whereArgs: [trainingId]);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return db.query('favorites');
  }

  Future<bool> isFavorite(String trainingId) async {
    final db = await database;
    final result = await db.query('favorites', where: 'trainingId = ?', whereArgs: [trainingId]);
    return result.isNotEmpty;
  }
}
