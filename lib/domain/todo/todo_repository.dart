

import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:practiceddd/domain/category/database/todo_database.dart';
import 'package:sqflite/sqlite_api.dart';

class TodoRepository {
  final _db = TodoDatabase();

  final TodoDatabase _todoDatabase;

  TodoRepository(this._todoDatabase);

  Future<Future<void>> getTodos() async {
    return getTodos();
  }

    Future<void> insertMemo(Todo todo) async {
    // final Database _db = await database;
    await _db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTodo(Todo todo) async {
    return _todoDatabase.update(String, todo);
  }

  Future<void> deleteTodo(int id) async {
    return _todoDatabase.delete(id);
  }
}
