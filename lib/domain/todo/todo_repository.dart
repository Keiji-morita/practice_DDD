

import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:practiceddd/domain/category/database/todo_database.dart';

class TodoRepository {
  final _db = TodoDatabase();

  final TodoDatabase _todoDatabase;

  TodoRepository(this._todoDatabase);

  Future<Future<List>> getTodos() async {
    return _todoDatabase.getTodos();
  }

  Future<Todo> addTodo(Todo todo) async {
    return _todoDatabase.insert(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    return _todoDatabase.update(todo);
  }

  Future<void> deleteTodo(int id) async {
    return _todoDatabase.delete(id);
  }
}
