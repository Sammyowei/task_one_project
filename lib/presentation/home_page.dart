import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/constants/constants.dart';
import 'package:task_one_project/presentation/presenation.dart';
import 'package:task_one_project/services/services.dart';
import 'package:task_one_project/utils/utils.dart';
import 'package:task_one_project/widgets/widgets.dart';

import '../models/models.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final appConstants = AppConstants();
  final taskBox = Hive.box<TaskModel>(AppConstants.taskBox);
  @override
  void initState() {
    super.initState();
   getLength(); 
  }
  void getLength() {
    setState(() {
    taskBox.length;  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: appConstants.appName,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          textColor: appConstants.textColor,
                        ),
                        InkWell(
                          onTap: () {
                            DemoFunctionality.showmenu(context);
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: CircleAvatar(
                              backgroundColor: appConstants.secondaryColor,
                              radius: 24.0,
                              child: Image.asset(
                                AppIconManager.menuIcon,
                                color: appConstants.textColor,
                                height: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () =>
                        DemoFunctionality.showDemoSubscriptionToast(context),
                    child: CustomContainer(
                      subtitleTextSize: 15.5,
                      borderRadius: 30,
                      enabled: true,
                      title: 'Subscribe To Premium.',
                      subTitle: 'Buy premium membership.',
                      subTitleColor: appConstants.secondaryColor,
                      subTitleWeight: FontWeight.w600,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      titleWeight: FontWeight.bold,
                      backgroundColor: appConstants.assentColor,
                      circularAvaterBg: appConstants.textColor,
                      iconPath: AppIconManager.premiumIcon,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    text: "Pending Tasks",
                    textColor: appConstants.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(
                    child: PendingTask(),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 70,
                child: CustomFAB(
                  ontap: () => AppNavigation.pushToAddTaskScreen(context),
                  width: MediaQuery.of(context).size.width * 0.27,
                  height: 60,
                  color: appConstants.assentColor,
                  child: Hero(
                    tag: "addTask",
                    transitionOnUserGestures: true,
                    flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) =>
                        Container(
                      child: Icon(
                        Icons.add,
                        color: appConstants.textColor,
                        size: 30,
                      ),
                    ),
                    child: CustomText(
                      text: "Add Task",
                      fontWeight: FontWeight.bold,
                      textColor: appConstants.textColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
