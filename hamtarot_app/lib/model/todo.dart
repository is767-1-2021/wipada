import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final int id;
  final String title;
  final String content;

  Todo(this.id, this.title, this.content);

  factory Todo.fromJson(
    Map<String, dynamic> json,
  ) {
    return Todo(
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
    );
  }
}

class AllTodos {
  final List<Todo> todos;
  AllTodos(this.todos);

  factory AllTodos.fromJson(List<dynamic> json) {
    List<Todo> todos;

    todos = json.map((index) => Todo.fromJson(index)).toList();
    return AllTodos(todos);
  }

  factory AllTodos.fromsnapshot(QuerySnapshot s) {
    List<Todo> todos = s.docs.map((DocumentSnapshot ds) {
      return Todo.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllTodos(todos);
  }
}
