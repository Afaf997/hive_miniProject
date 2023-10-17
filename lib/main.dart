import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_withprovider/controller/maincontroller.dart';
import 'package:project_withprovider/controller/todolistcontroller.dart';
import 'package:project_withprovider/model/todomodel.dart';
import 'package:project_withprovider/view/mainPage.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>("todosBox");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider( create: (_) => Mainprovider(),
    ),
    ChangeNotifierProvider(create: (_) => TodoListController()),
  ], child: MyApp()));
}
