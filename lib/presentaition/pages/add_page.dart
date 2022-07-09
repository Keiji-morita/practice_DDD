import 'package:flutter/material.dart';

import '../../domain/todo_data.dart';

class AddingPage extends StatefulWidget {
    const AddingPage({ Key? key }) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final _todoController = TextEditingController();
  String addedTodo = "";
  
  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nanisunnen?'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _todoController,
                
                // onChanged:(text){
                //   setState(() {
                //     addedTodo = text;
                //   });
                // },
              ),


              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);

                  setState(() {
                    Todos.add(_todoController.text);
                    } 
                  );

                  print(Todos);
                  // print(addedTodo);
                },
                child: Text('Yarude!'),
              ),
            ],
          )
        ),
      )
    );
  }
}

