import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_withprovider/controller/maincontroller.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/view/list.dart';
import 'package:project_withprovider/view/showList.dart';
import 'package:project_withprovider/view/showTodo.dart.dart';
import 'package:project_withprovider/view/todo.dart';
import 'package:provider/provider.dart';

class ListDetailsWidget extends StatelessWidget {
 ListDetailsWidget({super.key});
   final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final todoListViewModel = Provider.of<TodoListController>(context,);
    final todosBox = todoListViewModel.todosBox;
    List screens = [const ShowTodo(), const ShowList()];
    final mainprovider = Provider.of<Mainprovider>(context);

    // ignore: unused_local_variable
    Widget selectedWidget;

    if (mainprovider.selectedIndex.index == 0) {
      selectedWidget =const  TodoDetailsWidget ();
    } else {
      selectedWidget =  ListDetailsWidget ();
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 224, 241),
      body: screens[mainprovider.selectedIndex.index],
      bottomNavigationBar: Container(
          height: 80,
          color: Color.fromARGB(255, 7, 19, 31),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: GNav(
              gap: 7,
              color: Colors.white,
              activeColor: Colors.white,
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
              _addTodoItem(todoListViewModel,context,  );
            } else {
              _addListItem(context);
            }
          },
          backgroundColor: Color.fromARGB(255, 5, 14, 27),
          child: const Icon(Icons.add)),
    );
  }
}

void _addTodoItem(todoListViewModel , BuildContext context) {
  final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
  // ignore: no_leading_underscores_for_local_identifiers
  Widget _buildInputField({

    TextEditingController? controller,
    // IconData? icon,
    String hintText = '',
    dynamic color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16.0),
           filled: true,
           fillColor: const Color.fromARGB(255, 211, 208, 208),
        ),
      ),
    );
  }
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
         decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        // color:const Color.fromARGB(255, 5, 26, 43),
        color: Color.fromARGB(255, 229, 229, 236) 
      ),
        child: Padding(
          padding:const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              _buildInputField(
                controller: titlecontroller,
                  hintText: 'Title',
                  color: Colors.grey),
              _buildInputField(
                controller: subtitlecontroller,
                hintText: 'Description',
                 color: Colors.grey
          
              ),
              Padding(
                padding:const EdgeInsets.only(left: 240, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 25, 13, 66), 
                  // Text color
                        elevation: 5),
                  onPressed: () {
                      if (todoListViewModel.editingTodo != null) {
                      // Update existing todo
                      todoListViewModel.updateTodoList(
                        todoListViewModel.editingTodo!,
                        titlecontroller.text,
                        subtitlecontroller.text,
                      );
                    } else {
                      // Add a new todo
                      todoListViewModel.addTodoList(
                        titlecontroller.text,
                        subtitlecontroller.text,
                      );
                    }
                    Navigator.pop(context);
                    titlecontroller.clear();
                    subtitlecontroller.clear();
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _addListItem(BuildContext context) {}
