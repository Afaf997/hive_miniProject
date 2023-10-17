import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
// import 'package:project_withprovider/model/todomodel.dart';
import 'package:project_withprovider/view/updateTodo.dart';
import 'package:project_withprovider/widgets/app.dart';
import 'package:provider/provider.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});
  @override
  Widget build(BuildContext context) {
    final todoListViewModel = Provider.of<TodoListController>(context);
    final todosBox = todoListViewModel.todosBox;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 225, 230),
      // backgroundColor:const Color.fromARGB(255, 5, 26, 43),
      appBar: appBarMode(
          centerTitle: true,
          title: "todo App",
          backgroundColor: Color.fromARGB(255, 21, 41, 56),
          ),
          // backgroundColor:  const Color.fromARGB(255, 5, 26, 43)),
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
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 120,
                child: Card(
                  shadowColor: const Color.fromARGB(255, 8, 5, 17),
                  // color: Color.fromARGB(255, 218, 216, 218),
                  color: const Color.fromARGB(255, 21, 41, 56),
                  elevation: 12,
                  // Add elevation for a card effect
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(6), // Card border radius
                  ),
                  child: ListTile(
                    title: Text(toDo.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white)),
                    subtitle: Text(
                      toDo.description,
                      style: const TextStyle(
                          color:Colors.white,fontSize: 15),
                    ),
                    trailing:IconButton(onPressed: (){
                       editTodoItem(context, toDo, todoListViewModel);
                    }, icon:const Icon(Icons.edit,color: Colors.white,)) ),
                    ),
              ),
            ),
                   );},),),]
      
    ));
           }
         }



void _addListItem(BuildContext context) {}


