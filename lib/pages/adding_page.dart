import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
    const AddingPage({ Key? key }) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final _todocontroller = TextEditingController();
  
  @override
  void dispose() {
    _todocontroller.dispose();
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
                controller: _todocontroller,
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(_todocontroller.text);
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

