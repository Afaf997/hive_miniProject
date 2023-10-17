import 'package:flutter/material.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/model/todomodel.dart';

void editTodoItem(BuildContext context, ToDoModel todo, TodoListController todoListViewModel) {
  final titleController = TextEditingController(text: todo.title);
  final descriptionController = TextEditingController(text: todo.description);

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
    // backgroundColor: const Color.fromARGB(255, 212, 211, 211),
    backgroundColor: Color.fromARGB(255, 5, 26, 43),
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          // color:  Color.fromARGB(255, 5, 26, 43),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              _buildInputField(
                controller: titleController,
                hintText: 'Title',
                color: Colors.grey,
              ),
              _buildInputField(
                controller: descriptionController,
                hintText: 'Description',
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 240, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    elevation: 5,
                  ),
                  onPressed: () {
                    todoListViewModel.updateTodoList(
                      todo,
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
