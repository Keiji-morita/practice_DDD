import 'package:flutter/material.dart';
import 'package:practiceddd/presentaition/notifiers/todo_notifier.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = TodoNotifier();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nanisunnen?'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _todoController,
            ),
            ElevatedButton(
              onPressed: () {
                notifier.addTodo(_todoController.text);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Yarude!'),
            ),
          ],
        ),
      ),
    );
  }
}
