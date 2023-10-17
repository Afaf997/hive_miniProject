import 'package:flutter/material.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/widgets/app.dart';
import 'package:provider/provider.dart';

class TodoDetailsWidget extends StatelessWidget {
  const TodoDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final todoListViewModel = Provider.of<TodoListController>(context,);
    final todosBox = todoListViewModel.todosBox;
    return Scaffold(
      appBar: appBarMode(
        centerTitle:true,
        title: "todo App",
      backgroundColor: const Color.fromARGB(255, 5, 26, 43)
       ),
       body: ListView.separated(
        itemCount:todosBox.length,
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.grey); // Separator
        },
        itemBuilder: (context, index) {
          final toDo = todosBox[index];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(6), // Border
              ),
              child: ListTile(
                title: Text(toDo.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Text(toDo.description),
                
                onLongPress: () {},
                  
             
              ),
            ),
          );
        },
      ),
      
    
    );
  }
}
