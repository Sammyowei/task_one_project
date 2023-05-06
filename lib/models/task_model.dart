import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';



@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isCompleted;

  @HiveField(3)
  final String? dueDate;

  // final DateTime createdAt;
  // final DateTime updatedAt;void
  // final DateTime completedAt;
  TaskModel({
    this.dueDate,
    required this.title,
    required this.description,
    required this.isCompleted,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.completedAt,
  });
}


class HiveBoxes{
  static Box<TaskModel> getTaskBox() => Hive.box<TaskModel>("tasksBox");

void registerHiveAdapters(){
  Hive.registerAdapter(TaskModelAdapter());
}
}