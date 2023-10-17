import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_withprovider/model/todomodel.dart';


class TodoListController extends ChangeNotifier {
  final Box<ToDoModel> _todomodelList = Hive.box("todosBox");
  List<ToDoModel> get todosBox => _todomodelList.values.toList();
   ToDoModel? editingTodo;

  void addTodoList(String title, String description ) {
    final newTodoList = ToDoModel(
        title: title, description: description);
    _todomodelList.add(newTodoList);
    notifyListeners();
  }
  void updateTodoList(ToDoModel todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    todo.save();
    editingTodo = null; // Reset the editingTodo after updating
    notifyListeners();
  }

  void startEditing(ToDoModel todo) {
    editingTodo = todo; // Set the todo to be edited
  }

  void cancelEditing() {
    editingTodo = null; // Cancel editing mode
  }

  void deleteTodo(ToDoModel tododelete ) {
    tododelete.delete();
    notifyListeners();

  }
}
