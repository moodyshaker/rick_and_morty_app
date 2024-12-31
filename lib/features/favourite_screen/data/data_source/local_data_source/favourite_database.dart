import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteDataBase {
  static final FavouriteDataBase instance = FavouriteDataBase._instance();

  FavouriteDataBase._instance();

  static const String _tableName = 'favourite_characters';
  static const String _characterId = '_id';
  static const String _characterName = 'name';
  static const String _characterStatus = 'status';
  static const String _characterSpecies = 'species';
  static const String _characterImage = 'image';
  static const String _characterGender = 'gender';
  static const int version = 1;
  Database? _db;

  Future<Database?> initDatabase() async {
    if (_db == null) {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, _tableName);
      _db =
          await openDatabase(path, onCreate: (Database db, int version) async {
        db.execute('''CREATE TABLE $_tableName(
     $_characterId INTEGER PRIMARY KEY NOT NULL,
     $_characterStatus TEXT NOT NULL,
     $_characterName TEXT NOT NULL,
     $_characterSpecies TEXT NOT NULL,
     $_characterGender TEXT NOT NULL,
     $_characterImage Text NOT NULL)''');
      }, version: version);
    }
    return _db;
  }

  Future<bool> addToFavourite(FavouriteCharacterModel model) async {
    int inserted = await _db!.insert(_tableName, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return inserted != 0;
  }

  Future<bool> deleteFromFavourite(int id) async {
    int deleted =
        await _db!.rawDelete('DELETE FROM $_tableName WHERE _id = $id');
    return deleted != 0;
  }

  Future<bool> isFavourite(int id) async {
    List<Map<String, dynamic>> list =
        await _db!.rawQuery('SELECT * FROM $_tableName WHERE _id = $id');
    log('isFavourite -> id:$id - value:${list.isNotEmpty}');
    return list.isNotEmpty;
  }

  Future<List<FavouriteCharacterModel>> getAllFavourites() async {
    List<Map<String, dynamic>> list =
        await _db!.rawQuery('SELECT * FROM $_tableName DESC');
    List<FavouriteCharacterModel> favouriteCharactersList =
        list.map((e) => FavouriteCharacterModel.fromMap(e)).toList();
    return favouriteCharactersList;
  }
}
