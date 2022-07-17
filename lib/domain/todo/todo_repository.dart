

import 'package:path/path.dart';
import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:practiceddd/domain/category/database/todo_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// class TodoRepository {
//   final _db = TodoDatabase();

//   final TodoDatabase _todoDatabase;

//   TodoRepository(this._todoDatabase);


//   static Future<void> addTodo(Todo todo) async {
//     String dbFilePath = await getDatabasesPath();
//     String path = join(dbFilePath, TodoDatabase().dbName);

//     int id = todo.id;
//     String title = todo.title;

//     // SQL文
//     String query = 'INSERT INTO${TodoDatabase().tabeleName} (id の title を加えます！)';

// Database db = await openDatabase(path, version: TodoDatabase().dbVersion, onCreate: (Database db, int version) async {
//       await db.execute(
//         "CREATE TABLE IF NOT EXISTS ${TodoDatabase().tabeleName} (id INTEGER PRIMARY KEY, name TEXT, day TEXT, month INTEGER, dayInt INTEGER, memo TEXT, type TEXT, mute INTEGER)"
//       );
//     });

//     await db.transaction((txn) async {
//       int id = await txn.rawInsert(query);
//       print("保存成功 id: $id");
//     });
//   }
  

//     static Future<List<Todo>> getTodos() async {
//     /// データベースのパスを取得
//     String dbFilePath = await getDatabasesPath();
//     String path = join(dbFilePath, TodoDatabase().dbName);

//     /// テーブルがなければ作成する
//     Database db = await openDatabase(
//       path,
//       version: TodoDatabase().dbVersion,
//       onCreate: (Database db, int version) async {
//         await db.execute("CREATE TABLE IF NOT EXISTS ${TodoDatabase().tabeleName} (id INTEGER PRIMARY KEY, name TEXT, day TEXT, month INTEGER, dayInt INTEGER, memo TEXT, type TEXT, mute INTEGER)"
//         );
//     });
//     /// SQLの実行
//     List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ${TodoDatabase().tabeleName} ORDER BY month = ${DateTime.now().month} AND dayInt = ${DateTime.now().day} DESC, type = "important" DESC,type = "semi-important" DESC, month >= ${DateTime.now().month} DESC,month ASC, dayInt ASC');
//     // Todo.fromJson(result);
//     List<Todo> Todos = [];
//     result.forEach((Map<String, dynamic> map){
//       Todos.add(Todo.fromMap(map));
//     });
//     return Todos;
//   }
  
//     static Future<dynamic> deleteTodo(Todo todo) async {
//     /// データベースのパスを取得
//     String dbFilePath = await getDatabasesPath();
//     String upath = join (dbFilePath, TodoDatabase().dbName);
//     String ppath = join (dbFilePath, TodoDatabase().dbName);

//     /// テーブルがなければ作成する
//     Database udb = await openDatabase(
//       upath,
//       version: TodoDatabase().dbVersion,
//       onCreate: (Database db, int version) async {
//         await db.execute("CREATE TABLE IF NOT EXISTS ${TodoDatabase().tabeleName} (id INTEGER PRIMARY KEY, name TEXT, day TEXT, month INTEGER, dayInt INTEGER, memo TEXT, type TEXT, mute INTEGER)"
//         );
//       }
//     );
//     Database pdb = await openDatabase(
//       ppath,
//       version: TodoDatabase().dbVersion,
//       onCreate: (Database db, int version) async {
//         await db.execute("CREATE TABLE IF NOT EXISTS ${TodoDatabase().tabeleName} (id INTEGER PRIMARY KEY, day TEXT, memo TEXT, user_id INTEGER, year INTEGER, month INTEGER, dayInt INTEGER)"
//         );
//       }
//     );
//     /// SQLの実行
//     await udb.delete('${TodoDatabase().tabeleName}', where: "id = ${todo.id}");
//     await pdb.delete('${TodoDatabase().tabeleName}', where: "user_id = ${todo.id}");
//     print("remove完了");
//   }

//   }

class TodoRepository {
  final _db = TodoDatabase();

  final TodoDatabase _todoDatabase;

  TodoRepository(this._todoDatabase);

  Future<List<Todo>> getTodos() async {
    return await _todoDatabase.getTodos();
  }

  Future<Todo> addTodo(Todo todo) async {
    return _todoDatabase.insert(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    return _todoDatabase.update(Todo, todo);
  }

  Future<void> deleteTodo(int id) async {
    return _todoDatabase.delete(id);
  }
}

