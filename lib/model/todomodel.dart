import 'package:hive/hive.dart';

  part 'todomodel.g.dart';

@HiveType(typeId: 1)
class ToDoModel extends HiveObject{

  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
 

 

  ToDoModel({required this.title,required this.description });

}