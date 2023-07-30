import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../../components/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'task';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db ');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'task.db';
        print('in datebase');
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE $_tableName  (id INTEGER PRIMARY KEY, title TEXT, note TEXT, isCompleted INTEGER, date TEXT, startTime TEXT, endTime TEXT, color INTEGER, repeat TEXT)');
        });
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task task) async {
    print('insert');
    return await _db!.insert(_tableName, task.toJson());
  }

  static Future<int> delete(Task task) async {
    print('delete');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('deleteAll');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('query');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    print('update');
    return await _db!.rawUpdate('UPDATE task  SET isCompleted = ? ', [1]);
  }
}
