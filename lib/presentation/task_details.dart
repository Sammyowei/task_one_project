import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/constants/app_constants.dart';
import 'package:task_one_project/widgets/widgets.dart';

import '../models/models.dart';

class TaskDetail extends ConsumerStatefulWidget {
  final String? title;
  final String? description;
  final String? date;
  final bool? isComplete;
  final int index;
  const TaskDetail({
    required this.index,
    this.title,
    this.description,
    this.date,
    this.isComplete,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskDetailState();
}

class _TaskDetailState extends ConsumerState<TaskDetail> {
  Box<TaskModel>? taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box<TaskModel>(AppConstants.taskBox);
    taskBox!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants().primaryColor,
        actions: [],
        title: const Hero(
          tag: "title",
          child: CustomText(
            text: "Task Details",
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Task Title:',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree,
            ),
            CustomText(
              text: widget.title!,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Task Description:',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree,
            ),
            CustomText(
              text: widget.description!,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Due Date:',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree,
            ),
            CustomText(
              text: widget.date!,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree.withOpacity(0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Task Status:',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree,
            ),
            CustomText(
              text: widget.isComplete! ? "Completed" : "Pending",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textColor: AppConstants().secondaryColorThree.withOpacity(0.7),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                final task = taskBox!.getAt(widget.index);
                task!.delete();
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppConstants().assentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomText(
                    text: "Completed Task",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppConstants().secondaryColorThree,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
