import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/todo.dart';

abstract class Services {
  set currenttodos(Todo currenttodos) {}

  Future<List<Todo>> getTodos();
}

class firebaseService extends Services {
  @override
  Future<List<Todo>> getTodos() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ham_temple')
        //.where('id', isGreaterThan: 2)
        //.where('completed', isEqualTo: 'True')
        .orderBy('id')
        .get();

    AllTodos todos = AllTodos.fromsnapshot(snapshot);
    return todos.todos;
  }
}
