import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:project_withprovider/controller/time.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/view/updateTodo.dart';
import 'package:provider/provider.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});
  @override
  Widget build(BuildContext context) {
    final todoListViewModel = Provider.of<TodoListController>(context);
    final todosBox = todoListViewModel.todosBox;
     // ignore: unused_local_variable
     final isGridView = Provider.of<ViewModeProvider>(context).isGridView;

     void toggleViewMode() {
      Provider.of<ViewModeProvider>(context, listen: false).toggleViewMode();}
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: <Widget>[
             Row(
                  children: [
                 const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'NOTES BUCKET',
                      style: TextStyle(
                        fontSize: 23, 
                        fontWeight:
                            FontWeight.bold, 
                      ),
                    ),),
                    Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: IconButton(
                    onPressed: toggleViewMode, // Toggle view mode when clicked
                    icon: Consumer<ViewModeProvider>(
                      builder: (context, viewModeProvider, child) {
                        return viewModeProvider.isGridView
                            ? const Icon(Icons.grid_view_outlined)
                            : const Icon(Icons.table_rows_rounded);
                      },
                    ),
                  ),
                ),
              ]
            ),
           
            todosBox.isEmpty
                ? Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Center(
                      child: SizedBox(
                        height: 220,
                        width: 220,
                        child: Lottie.asset(
                          'assets/animation/empty.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                )
                : Expanded(
                    child: Consumer<ViewModeProvider>(
                      builder: (context, viewModeProvider,child) {
                        return viewModeProvider.isGridView
                            ? GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Change this to the number of columns you want
                                ),
                                itemCount: todosBox.length,
                                itemBuilder: (context, index) {
                                  final toDo = todosBox[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
                                          onPressed: (context) {
                                            todoListViewModel.deleteTodo(toDo);
                                          },
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: SizedBox(
                                        height: 100,
                                        child: Card(
                                          color: const Color.fromARGB(255, 232, 236, 233),
                                          shadowColor: const Color.fromARGB(255, 8, 5, 17),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: ListTile(
                                            title: Text(toDo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                                            subtitle: Text(toDo.description, style: const TextStyle(fontSize: 15)),
                                            trailing: IconButton(
                                              onPressed: () {
                                                editTodoItem(context, toDo, todoListViewModel);
                                              },
                                              icon: const Icon(Icons.edit),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: todosBox.length,
                                itemBuilder: (context, index) {
                                  final toDo = todosBox[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          backgroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: "Delete",
                                          onPressed: (context) {
                                            todoListViewModel.deleteTodo(toDo);
                                          },
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: SizedBox(
                                        height: 100,
                                        child: Card(
                                          color: const Color.fromARGB(255, 232, 236, 233),
                                          shadowColor: const Color.fromARGB(255, 8, 5, 17),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: ListTile(
                                            title: Text(toDo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                                            subtitle: Text(toDo.description, style: const TextStyle(fontSize: 15)),
                                            trailing: IconButton(
                                              onPressed: () {
                                                editTodoItem(context, toDo, todoListViewModel);
                                              },
                                              icon: const Icon(Icons.edit),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
