import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practiceddd/domain/todo/todo_data.dart';

final todoNotifierProvider = StateNotifierProvider<TodoNotifier, TodoState>(
  (ref) => TodoNotifier(ref: ref),
);

class TodoState {
  const TodoState({this.todoList = const []});

  final List<Todo> todoList;

  TodoState copyWith({List<Todo>? todoList}) {
    return TodoState(todoList: todoList ?? <Todo>[]);
  }
}

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier({required Ref ref})
      : _ref = ref,
        super(const TodoState());

  final Ref _ref;
  
  get title => null;

  void addTodo(String title) {
    // idはincrementする形で作成する
    final id = state.todoList.length + 1;

    state = state.copyWith(
      todoList: [
        const Todo().copyWith(id: id, title: title),
        ...state.todoList,
      ],
    );
  }

  void deleteTodo(int id) {
    final newList = state.todoList.where((Todo) => Todo.id != id).toList();
    state = state.copyWith(todoList: newList);
  }
} 
