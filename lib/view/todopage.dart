import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_withprovider/controller/maincontroller.dart';
import 'package:project_withprovider/controller/notesController.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/view/addFunction.dart';
import 'package:project_withprovider/view/addListIte.dart';
import 'package:project_withprovider/view/list.dart';
import 'package:project_withprovider/view/showList.dart';
import 'package:project_withprovider/view/showTodo.dart.dart';
import 'package:provider/provider.dart';

class ListDetailsWidget extends StatelessWidget {
  ListDetailsWidget({super.key});
  final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notesListViewModel = Provider.of<Notescontroller>(context);
    final todo = notesListViewModel.todosBox;
    
    final todoListViewModel = Provider.of<TodoListController>(
      context,
    );
    final todosBox = todoListViewModel.todosBox;
    List screens = [ ShowTodo(), const ShowList()];
    final mainprovider = Provider.of<Mainprovider>(context);

    // ignore: unused_local_variable
    Widget selectedWidget;

    if (mainprovider.selectedIndex.index == 0) {
      selectedWidget = TodoDetailsWidget();
    } else {
      selectedWidget = ListDetailsWidget();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 235, 243),
      body: screens[mainprovider.selectedIndex.index],
      bottomNavigationBar: Container(
          height: 80,
          // color: Color.fromARGB(255, 7, 19, 31),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: GNav(
              gap: 7,
              color: Colors.black,
              activeColor: Colors.black,
              iconSize: 26,
              duration: const Duration(microseconds: 400),
              onTabChange: (index) {
                mainprovider.changeselectIndex(index);
              },
              tabs: const [
                GButton(icon: CupertinoIcons.calendar, text: "todo"),
                GButton(icon: CupertinoIcons.list_dash, text: "list"),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (mainprovider.selectedIndex.index == 0) {
              addTodoItem(
                todoListViewModel,
                context,
              );
            } else {
              addListItem( notesListViewModel,context);
            }
          },
          backgroundColor: Color.fromARGB(255, 5, 14, 27),
          child: const Icon(Icons.add)),
    );
  }
}


