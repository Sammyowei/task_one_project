import 'package:flutter/material.dart';
import 'package:task_one_project/presentation/presenation.dart';
import 'package:task_one_project/utils/utils.dart';

class AppNavigation {
  static void pushToHomePageFromSplashScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      CustomPageRoute(
        child: const HomePage(),
      ),
      (route) => false,
    );
  }

  static void pushToAddTaskScreen(BuildContext context) {
    Navigator.of(context).push(
      CustomPageRoute(
        duration: 500,
        child: const AddTask(),
      ),
    );
  }

  static void pushToTaskDetailScreen(BuildContext context, {required String title,
      required String description,required String date, required bool isComplete, required int index}) {
    Navigator.of(context).push(
      CustomPageRoute(
        duration: 500,
        child: TaskDetail(
          index: index,
          date: date,
          description: description,
          isComplete: isComplete,
          title: title,
        ),
      ),
    );
  }
}
