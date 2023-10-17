import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/widgets/app.dart';
import 'package:provider/provider.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});
  @override
  Widget build(BuildContext context) {
    final todoListViewModel = Provider.of<TodoListController>(context);
    final todosBox = todoListViewModel.todosBox;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 225, 230),
      appBar: appBarMode(
          centerTitle: true,
          title: "todo App",
          backgroundColor: const Color.fromARGB(255, 83, 103, 119)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
            todosBox.isEmpty? 
        Center(
           child: SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/animation/empty.json',
                fit: BoxFit.cover, ),
          ),
        )
     
        : 
        Expanded(
        child: ListView.builder(
          itemCount: todosBox.length,
          itemBuilder: (context, index) {
            final toDo = todosBox[index];
            return Slidable(
                endActionPane:
                  ActionPane(motion: const DrawerMotion(), children: [
                SlidableAction(
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: "Delete",
                    onPressed: (context) { todoListViewModel.deleteTodo(toDo);}
                    ),
              ],),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 120,
                child: Card(
                  shadowColor: const Color.fromARGB(255, 18, 53, 82),
                  // color: Color.fromARGB(255, 218, 216, 218),
                  elevation: 12,
                  // Add elevation for a card effect
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(6), // Card border radius
                  ),
                  child: ListTile(
                    title: Text(toDo.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      toDo.description,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 48, 84, 112),fontSize: 15),
                    ),
                    trailing:IconButton(onPressed: (){}, icon:const Icon(Icons.edit)) ),
                    ),
              ),
            ),
                   );},),),]
      
    ));
           }
         }

void _addTodoItem(todoListViewModel, BuildContext context) {
  final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
// ignore: no_leading_underscores_for_local_identifiers
  Widget _buildInputField({
    TextEditingController? controller,
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
          color: Colors
              .white, // Set the background color for the BottomSheet content
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              _buildInputField(
                  controller: titlecontroller,
                  // icon: Icons.title,
                  hintText: 'Title',
                  color: Colors.grey),
              _buildInputField(
                controller: subtitlecontroller,
                // icon: Icons.title_sharp,
                hintText: 'Description',
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(255, 9, 30, 48), // Text color
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
