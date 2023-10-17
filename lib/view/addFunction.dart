import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(left: 15, right: 15,),
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
    backgroundColor: const Color.fromARGB(255, 5, 26, 43),
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Color.fromARGB(255, 5, 26, 43),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors
              .white, // Set the background color for the BottomSheet content
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
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