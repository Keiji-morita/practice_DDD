import 'package:flutter/material.dart';
import 'package:practiceddd/presentaition/notifiers/todo_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddingPage extends ConsumerWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //変更を通知するからnotifierを使う
    final notifier = ref.watch(todoNotifierProvider.notifier);
    final todoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nanisunnen?'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: todoController,
            ),
            ElevatedButton(
              onPressed: () {
                notifier.addTodo(todoController.text);
                Navigator.pop(context);

                print(TodoState);
              },
              child: const Text('Yarude!'),
            ),
          ],
        ),
      ),
    );
  }
}
