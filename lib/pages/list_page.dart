import 'package:flutter/material.dart';
import 'package:practiceddd/pages/adding_page.dart';

class TodoList extends StatelessWidget {
  final List<String> todos = <String>['A', 'B', 'C'];

  @override
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
    }
  );
    }  
    }


