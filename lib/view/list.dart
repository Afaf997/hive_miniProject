import 'package:flutter/material.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/widgets/app.dart';
import 'package:provider/provider.dart';

class TodoDetailsWidget extends StatelessWidget {
 const TodoDetailsWidget({super.key});


  @override
  Widget build(BuildContext context) {
     final todoListViewModel = Provider.of<TodoListController>(context,);
    // ignore: unused_local_variable
    final todosBox = todoListViewModel.todosBox;
    return Scaffold(
      appBar: appBarMode(
        centerTitle:true,
        title: "todo App",
      backgroundColor: const Color.fromARGB(255, 5, 26, 43)
       ),
     
    
    );
  }
}
