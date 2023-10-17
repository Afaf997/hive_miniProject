import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_withprovider/controller/maincontroller.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/model/todomodel.dart';
// import 'package:project_withprovider/view/detailwidget.dart';
import 'package:project_withprovider/view/list.dart';
import 'package:project_withprovider/view/showList.dart';
import 'package:project_withprovider/view/showTodo.dart.dart';
import 'package:project_withprovider/view/todo.dart';
// import 'package:hive_provider/controller/todoListController.dart';
// import 'package:hive_provider/widgets/buttons.dart';
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
      backgroundColor: const Color.fromARGB(255, 201, 199, 199),
      body: screens[mainprovider.selectedIndex.index],
      bottomNavigationBar: Container(
          height: 80,
          color: const Color.fromARGB(255, 5, 26, 43),
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
          backgroundColor: const Color.fromARGB(255, 5, 26, 43),
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
    double? height,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
          // prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16.0),
           filled: true, // Set filled to true
           fillColor: const Color.fromARGB(255, 211, 208, 208),
        ),
      ),
    );
  }
  showModalBottomSheet(
  backgroundColor: const Color.fromARGB(255, 212, 211, 211),
    context: context,
    builder: (BuildContext context) {
      return Container(
         decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white, 
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
                height: 200,
              ),
              Padding(
                padding:const EdgeInsets.only(left: 230, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:  const Color.fromARGB(255, 9, 30, 48), // Text color
                        elevation: 5),
                  onPressed: () {
                      todoListViewModel.addTodoList(
                        titlecontroller.text,
                        subtitlecontroller.text,
                      );
                      Navigator.pop(context);
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
