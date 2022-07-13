import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'todo_data.dart';

@immutable
class Todo {
  const Todo({this.id = 0, this.title = '', this.isDone = false,});

  final int id;
  final String title;
  final bool isDone;

  Todo copyWith({int? id, String? title, bool? isDone}) {
    return Todo(id: id ?? this.id, title: title ?? this.title, isDone: isDone ?? this.isDone);
  }

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      };
    }

  static fromJson(Map<String, Object?> map) {}

  // factory Todo.fromMap(Map<String, dynamic> json) => new Todo(
  //   id: json['id'],
  //   title: json['title'],
  // );

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //   };
  // }
}

//   class DatebaseHelper {

//     DatebaseHelper._privateConstructor();
//     static final DatebaseHelper instance = DatebaseHelper._privateConstructor();

//     static Database? _database;
//     Future<Database> get database async => _database ??= await _initDatabase();
  

// Future <Database> _initDatabase() async {
//   Directory documentDirectory = await getApplicationDocumentsDirectory();
//   String path = join(documentDirectory.path, 'todos.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
// }

// Future _onCreate(Database db, int version) async {
//   await db.execute('''
//     CREATE TABLE TODOS(
//     id INTEGER PRIMARY KEY,
//     title TEXT,
//     )
//     ''');
// }

// Future<List<Todo>?> getTodos() async {
//   Database db = await instance.database;

//   var Todo = await db.query('todos', orderBy: 'title');
//   List<Todo> todoList = Todo.isNotEmpty
//           ? Todo.map((c) => Todo.fromMap(c)).toList()
//           :[];
//       return todoList;
// }
//   }