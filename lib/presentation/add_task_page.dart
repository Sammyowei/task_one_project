import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/models/models.dart';
import 'package:task_one_project/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

import '../constants/constants.dart';
import '../widgets/widgets.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  Box<TaskModel>? taskBox;
  DateTime selectedDate = DateTime.now();
  String dateValue = "Select Date";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate(
    BuildContext context,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateValue = "${DateFormat('dd-MM-yyyy').format(selectedDate)} ";
      });
      log('Selected date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}');
    }
  }

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box<TaskModel>(AppConstants.taskBox);
    taskBox!;
  }

  void _addTask() async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final date = dateValue;
      final task = TaskModel(
        title: title,
        description: description,
        dueDate: date,
        isCompleted: false,
      );
      await taskBox!.add(task).then((value) {
        if (context.mounted) {
          context.showToastySnackbar("Added",
              "Your task has been sucessfully added.", AlertType.success);
          Navigator.pop(context);
          _titleController.clear();
          _descriptionController.clear();

          return;
        }
        setState(() {
          taskBox!.length;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appConstants = AppConstants();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          height: 25,
                          AppIconManager.backIcon,
                          color: AppConstants().secondaryColorThree,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Hero(
                        tag: "addTask",
                        child: CustomText(
                          text: "Add Task",
                          fontSize: 25,
                          textColor: AppConstants().textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: "Task Title",
                  fontSize: 20,
                  textColor: AppConstants().textColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  growable: false,
                  hintText: "Enter Title",
                  controller: _titleController,
                  validator: "Task title is required",
                ),
                const SizedBox(height: 30),
                CustomText(
                  text: "Task Description",
                  fontSize: 20,
                  textColor: AppConstants().textColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  growable: true,
                  hintText: "Enter Description",
                  controller: _descriptionController,
                  validator: "Task description is required",
                ),
                const SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Due Date",
                            fontSize: 20,
                            textColor: AppConstants().textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: AppConstants()
                                    .secondaryColorThree
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: dateValue,
                                  fontSize: 18,
                                  textColor:
                                      AppConstants().textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "addTaskButton",
                        child: CustomFAB(
                          ontap: () => _addTask(),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          color: appConstants.assentColor,
                          child: CustomText(
                            text: "Add Task",
                            fontWeight: FontWeight.bold,
                            textColor: appConstants.textColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
