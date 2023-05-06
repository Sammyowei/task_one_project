import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/constants/app_constants.dart';
import 'package:task_one_project/services/services.dart';
import 'package:task_one_project/widgets/widgets.dart';

import '../models/models.dart';

class PendingTask extends ConsumerStatefulWidget {
  const PendingTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PendingTaskState();
}

class _PendingTaskState extends ConsumerState<PendingTask> {
  var taskBox = Hive.box<TaskModel>("tasksBox");
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, value, child) {
        if (taskBox.isEmpty) {
          return Center(
            child: CustomText(
              text: "No Pending Task",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColor,
            ),
          );
        } else if (taskBox.length > 0) {
          return ListView.builder(
            itemCount: taskBox.length,
            itemBuilder: (context, index) {
              final task = taskBox.getAt(index);

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  onTap: () => AppNavigation.pushToTaskDetailScreen(
                    context,
                    title: task.title,
                    description: task.description,
                    date: task.dueDate!,
                    isComplete: task.isCompleted,
                    index: index,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppConstants().secondaryColorThree,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          text: task!.title,
                          fontSize: 18,
                          textColor: AppConstants().primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
