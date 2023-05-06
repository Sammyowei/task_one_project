import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/constants/constants.dart';
import 'package:task_one_project/models/models.dart';
import 'package:task_one_project/services/services.dart';
import 'package:task_one_project/widgets/widgets.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("tasksBox");

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appConstants = AppConstants();
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: appConstants.primaryColor,
      ),
      title: appConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
      },
    );
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final appConstants = AppConstants();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => AppNavigation.pushToHomePageFromSplashScreen(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .95,
            child: Center(
              child: Hero(
                tag: appConstants.appName,
                child: CustomText(
                  text: appConstants.appName,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  textColor: appConstants.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
