import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_withprovider/model/todomodel.dart';


class Notescontroller extends ChangeNotifier {
  final Box<Todo> notesmodelList = Hive.box("todo");
  List<Todo> get todosBox => notesmodelList.values.toList();


  void addTodoList(String title, String subtitle) {
    final newTodoList = Todo(
        title: title, subtitle: subtitle, );
    notesmodelList.add(newTodoList);
    notifyListeners();
  }
  void TodoChecked(Todo todo) {
    todo.ischecked = !todo.ischecked;
    todo.save();
    notifyListeners();
  }
   void deleteTodo(Todo tododelete ) {
    tododelete.delete();
    notifyListeners();

  }

}
