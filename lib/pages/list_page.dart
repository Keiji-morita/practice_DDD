import 'package:flutter/material.dart';
import 'package:practiceddd/pages/adding_page.dart';

import '../domain/note/todo_class.dart';

class TodoList extends StatefulWidget {
  

    const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
    // final List<String> todos = <String>['A', 'B', 'C'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yattoki!'),
      ),
    body: Center(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Card(
              child:  Center( 
              child: Text('${todos[index]}')
            ),
            )
          );
        }, 
      ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () async {
      final addedtodo = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                return AddingPage();
              })
      );

      if(addedtodo != null) {
        setState(() {
          todos.add(addedtodo);
        });
      };
      
    },
    child: Icon(Icons.add),
    ),
  );
    }  
    }


