import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practiceddd/presentaition/notifiers/todo_notifier.dart';
import 'package:practiceddd/presentaition/pages/todo/add_page.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoNotifierProvider);
    final notifier = ref.watch(todoNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yattoki!'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: state.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = state.todoList[index];
            return new Dismissible( 
              key: Key(state.todoList.length.toString()),
              onDismissed: (DismissDirection direction) {
                  notifier.deleteTodo(state.todoList.length);
              },

            child: SizedBox(
              height: 50,
              child: Card(
                child: Center(
                  child: Text(todo.title),
                ),
              ),
            )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddingPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
