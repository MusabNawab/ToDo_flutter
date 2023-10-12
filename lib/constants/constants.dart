import 'package:hive/hive.dart';
import 'package:todo/data/models/task.dart';

class AppConstants {
  static late Box appBox;
  static late Box<Task> localTaskBox;
  static const splashImgPath = "assets/images/splash.json";
  static final dummyData = [
    Task(
      title: 'Tap on \'+\' icon to add new task',
      status: false,
    ),
    Task(title: 'Slide left to delete a task', status: false),
    Task(
        title: 'Tap on check box (✓) to mark a task as completed',
        status: true),
  ];
}
