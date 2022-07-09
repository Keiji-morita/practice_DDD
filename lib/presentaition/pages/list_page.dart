import 'package:flutter/material.dart';
import 'package:practiceddd/presentaition/pages/add_page.dart';
import '../../domain/todo_data.dart';


class TodoList extends StatefulWidget {
  

    const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
    

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yattoki!'),
      ),
    body: Center(
      child: ListView.builder(
        itemCount: Todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Card(
              child:  Center( 
              child: Text('${Todos[index]}')
            ),
            )
          );
        }, 
      ),
    ),

    floatingActionButton: FloatingActionButton(
    onPressed: () async {
      Navigator.push(context, MaterialPageRoute(builder: 
      (context) => AddingPage()));
    },
    child: Icon(Icons.add),
    ),
  );
    }  
    }


