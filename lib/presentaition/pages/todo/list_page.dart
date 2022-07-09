import 'package:flutter/material.dart';
import 'package:practiceddd/presentaition/notifiers/todo_notifier.dart';
import 'package:practiceddd/presentaition/pages/todo/add_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Widget build(BuildContext context) {
    const state = TodoState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yattoki!'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: state.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = state.todoList[index];
            return SizedBox(
              height: 50,
              child: Card(
                child: Center(
                  child: Text(todo.title),
                ),
              ),
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
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
