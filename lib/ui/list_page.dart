import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<String> todos = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Card(
              child: Text('${todos[index]}')
            ),
          );
        }, 
      ),
    )
  );
  }
}

