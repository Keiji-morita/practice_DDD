import 'package:path/path.dart';
import 'package:practiceddd/domain/category/database/app_database.dart';
import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:sqflite/sqflite.dart';

// class TodoDatabase extends AppDatabase {
//   final String _tableName = 'todos';

//   Future<void> getTodos(todos, todo) async {
//     final Database db = await database;
//     await db.insert(
//       'todos', 
//       todos.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<void> insertMemo(todos, todo) async {
//     final Database db = await database;
//     await db.insert(
//       'todo',
//       todos.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

// Future<void> update(todos, todo) async {
//   // Get a reference to the database.
//   final db = await database;
//   await db.update(
//     'todos',
//     todo.toMap(),
//     where: "id = ?",
//     whereArgs: [todo.id],
//     conflictAlgorithm: ConflictAlgorithm.fail,
//   );
// }

// Future<void> delete(int id) async {
//   final db = await database;
//   await db.delete(
//     'todos',
//     where: "id = ?",
//     whereArgs: [id],
//   );
// }
// }
class TodoDatabase {

void databse() async{
final Future<Database> database = openDatabase(
  join(await getDatabasesPath(), 'memo_database.db'),
  onCreate: (db, version) {
    return db.execute(
      "CREATE TABLE memo(id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)",
    );
  },
  version: 1,
);
}

}