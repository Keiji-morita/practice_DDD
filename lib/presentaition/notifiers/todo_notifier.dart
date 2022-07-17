
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practiceddd/domain/todo/todo_data.dart';
import 'package:practiceddd/domain/todo/todo_repository.dart';

import '../../domain/category/database/todo_database.dart';

final todoNotifierProvider = StateNotifierProvider<TodoNotifier, TodoState>(
  (ref) => TodoNotifier(ref: ref,
  TodoRepository(TodoDatabase()),
  ),
  // 
);

class TodoState {
  const TodoState({this.todoList = const []});

  final List<Todo> todoList;

  TodoState copyWith({List<Todo>? todoList}) {
    return TodoState(todoList: todoList ?? <Todo>[]);
  }
}

class TodoNotifier extends StateNotifier<TodoState> {
  

  TodoNotifier(this._todoRepository,{required Ref ref} )
      : _ref = ref,
        super(const TodoState()) {
          getTodos();
        }

  final Ref _ref;
  final TodoRepository _todoRepository;
  get title => null;
  


  Future<void> addTodo(String title) async {
    final id = state.todoList.length + 1;
    final todos = await _todoRepository.addTodo(
      Todo(
        id: id,
        title: title,
      ),
    );
    // idはincrementする形で作成する
    


    state = state.copyWith(
      todoList: [
        const Todo().copyWith(id: id, title: title, isDone: false),
        ...state.todoList,
      ],
    );

    print("added");
  }

  void isChecked(bool isDone){
    isDone != isDone;
  }

  Future<List<Todo>> getTodos() async {
    final todos = await _todoRepository.getTodos();
    state = state.copyWith(todoList: todos);
    return todos;
  }

  Future<void> deleteTodo(int id) async{
    final newList = state.todoList.where((Todo) => Todo.id != id).toList();
    state = state.copyWith(todoList: newList);
  }
} 
