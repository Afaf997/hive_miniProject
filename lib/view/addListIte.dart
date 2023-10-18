import 'package:flutter/material.dart';

void addListItem(todoListViewModel, BuildContext context) {
  final titlecontroller = TextEditingController();
  final subtitlecontroller = TextEditingController();
   showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add a Todo Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(hintText: 'Enter title'),
            ),
            TextField(
              controller: subtitlecontroller,
              decoration: InputDecoration(hintText: 'Enter Subtitle'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              todoListViewModel.addTodoList(
                titlecontroller.text,
                subtitlecontroller.text,
              );
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );

  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return Container(
  //       decoration: const BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20),
  //           topRight: Radius.circular(20),
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(top: 10),
  //         child: Column(
  //           children: [
  //             TextField(
  //               controller: titlecontroller,
  //               decoration: const InputDecoration(
  //                 hintText: 'Enter title',
  //                 contentPadding: EdgeInsets.all(16.0),
  //               ),
  //             ),
  //             TextField(
  //               controller: subtitlecontroller,
  //               decoration: const InputDecoration(
  //                 hintText: 'Enter Subtitle',
  //                 contentPadding: EdgeInsets.all(16.0),
  //               ),
  //             ),
  //             Container(
  //               height: 60,
  //               width: 110,
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: Colors.white,
  //                   backgroundColor: const Color.fromARGB(255, 9, 30, 48),
  //                   elevation: 5,
  //                 ),
  //                 onPressed: () {
  //                   todoListViewModel.addTodoList(
  //                     titlecontroller.text,
  //                     subtitlecontroller.text,
  //                   );
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text(
  //                   "Save",
  //                   style: TextStyle(fontSize: 16),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  
   
    // Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.all(14),
    //         child: TextField(
    //           controller: titlecontroller,
    //           decoration: const InputDecoration(
    //             hintText: 'Enter  title',
    //             contentPadding: EdgeInsets.all(16.0),
    //           ),
              //  onSubmitted: (value) {
              //   if (value.trim().isNotEmpty) {
              //     todoViewModel.addTodo(value);
              //     _controller.clear(); 
              //   }
              // },
    //         ),
    //       ),
    //        Padding(
    //         padding: EdgeInsets.all(14),
    //         child: TextField(
    //           controller: subtitlecontroller,
    //           decoration: const InputDecoration(
    //             hintText: 'Enter  description',
    //             contentPadding: EdgeInsets.all(16.0),
    //           ),
    //         ),
    // ),
    //   Padding(
    //             padding: const EdgeInsets.only(left: 230, top: 30),
    //             child: Container(
    //               height: 60,
    //               width: 110,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                     foregroundColor: Colors.white,
    //                     backgroundColor:
    //                         const Color.fromARGB(255, 9, 30, 48), // Text color
    //                     elevation: 5),
    //                 onPressed: () {
    //                   todoListViewModel.addTodoList(
    //                     titlecontroller.text,
    //                     subtitlecontroller.text,
    //                   );
    //                   Navigator.pop(context);
    //                 },
    //                 child: const Text("Save",style: TextStyle(fontSize: 16),),
    //               ),
    //             ),
    //           ),
    // ]
    // );
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: todos.length,
          //     itemBuilder: (context, index) {
          //       final todo = todos[index];
          //       return ListTile(
          //           title: Text(todo.title),
          //           trailing: Checkbox(
          //             value: todo.ischecked,
          //             onChanged: (_) =>
                          // todoViewModel.TodoChecked(todo),
                    // ),
                    // onLongPress: () {
                      // todoViewModel.deleteTodo(todo);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Todo Deleted')));
//                     });
//               },
//             ),
//           ),
//         ],
//       ),
}
   

