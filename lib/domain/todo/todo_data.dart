import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  const Todo({this.id = 0, this.title = ''});

  final int id;
  final String title;

  Todo copyWith({int? id, String? title}) {
    return Todo(id: id ?? this.id, title: title ?? this.title);
  }
}
