import 'package:practiceddd/domain/todo/todo_data.dart';

class TodoState {
  const TodoState({this.todoList = const []});

  final List<Todo> todoList;

  TodoState copyWith({List<Todo>? todoList}) {
    return TodoState(todoList: todoList ?? <Todo>[]);
  }
}

class TodoNotifier {
  TodoNotifier();

  final _todo = const Todo();
  final _todoState = const TodoState();

  //
  void addTodo(String title) {
    // idはincrementする形で作成する
    final id = _todoState.todoList.length + 1;

    _todoState.copyWith(
      todoList: [
        _todo.copyWith(id: id, title: title),
        ..._todoState.todoList,
      ],
    );
  }
}
