import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:project_withprovider/controller/notesController.dart';
import 'package:project_withprovider/controller/time.dart';
import 'package:provider/provider.dart';

class ShowList extends StatelessWidget {
  const ShowList({super.key});

  @override
  Widget build(BuildContext context) {
    final notesListViewModel = Provider.of<Notescontroller>(context);
    final todo = notesListViewModel.todosBox;
    // ignore: unused_local_variable
    final isGridView = Provider.of<ViewModeProvider>(context).isGridView;

    void toggleViewMode() {
      Provider.of<ViewModeProvider>(context, listen: false).toggleViewMode();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'TO-DO_LISTS',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
              ],
            ),
            if (todo.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 130),
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
            else
              Expanded(
                child: Consumer<ViewModeProvider>(
                  builder: (context, viewModeProvider, child) {
                    return viewModeProvider.isGridView
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Change this to the number of columns you want
                            ),
                            itemCount: todo.length,
                            itemBuilder: (context, index) {
                              final toDo = todo[index];
                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      onPressed: (context) {
                                        notesListViewModel.deleteTodo(toDo);
                                      },
                                    ),
                                  ],
                                ),
                                child: Card(
                                  color: Color.fromARGB(255, 235, 233, 227),
                                  child: ListTile(
                                    title: Text(
                                      toDo.title,
                                      style: toDo.ischecked
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                              decoration: TextDecoration
                                                  .lineThrough, // Add this line
                                            )
                                          : const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      toDo.subtitle,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    trailing: Checkbox(
                                      value: toDo.ischecked,
                                      onChanged: (_) =>
                                          notesListViewModel.TodoChecked(toDo),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.separated(
                            itemCount: todo.length,
                            separatorBuilder: (context, index) => const Divider(
                              height: 0.5, // Customize divider height
                              color: Colors.grey, // Customize divider color
                            ),
                            itemBuilder: (context, index) {
                              final toDo = todo[index];
                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      onPressed: (context) {
                                        notesListViewModel.deleteTodo(toDo);
                                      },
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(
                                    toDo.title,
                                    style: toDo.ischecked
                                        ? const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                            decoration: TextDecoration
                                                .lineThrough, // Add this line
                                          )
                                        : const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                  ),
                                  subtitle: Text(
                                    toDo.subtitle,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  trailing: Checkbox(
                                    value: toDo.ischecked,
                                    onChanged: (_) =>
                                        notesListViewModel.TodoChecked(toDo),
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
