import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseUtil {
  static Future<sql.Database> database() async {
    final databasePath = await sql.getDatabasesPath();
    const String createSql =
        'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT, latitude REAL, longitude REAL, address TEXT)';

    return sql.openDatabase(
      path.join(databasePath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(createSql);
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DatabaseUtil.database();
    await database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DatabaseUtil.database();
    return database.query(table);
  }
}
