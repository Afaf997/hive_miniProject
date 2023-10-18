import 'package:hive/hive.dart';

part 'todomodel.g.dart';

@HiveType(typeId: 1)
class ToDoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  ToDoModel({required this.title, required this.description,});
}

@HiveType(typeId: 2)
class Todo extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool ischecked;
  @HiveField(2)
  String subtitle;

  Todo({required this.title, this.ischecked = false, required this.subtitle});
}
