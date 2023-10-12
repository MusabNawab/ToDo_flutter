//privacy policy link : https://doc-hosting.flycricket.io/to-do-privacy-policy/d721e3d7-9a18-48bd-bd41-fd7b16b6940d/privacy
// terms link : https://doc-hosting.flycricket.io/to-do-terms-of-use/39c53faf-194b-477e-9b10-c76d2de70f0c/terms

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants/constants.dart';
import 'data/models/task.dart';
import 'presentation/screens/aboutscreen/about.dart';
import 'presentation/screens/homescreen/homescreen.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';

late bool _appCheck;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  //initialize boxes
  AppConstants.localTaskBox = await Hive.openBox<Task>('taskBox');
  AppConstants.appBox = await Hive.openBox<bool>('appBox');

  //if app is opened for first time
  _appCheck = AppConstants.appBox.isEmpty;
  if (_appCheck) {
    //add dummy values
    for (var i = 0; i < AppConstants.dummyData.length; i++) {
      AppConstants.localTaskBox.put(i, AppConstants.dummyData[i]);
    }
    //mark app as opened
    AppConstants.appBox.put(0, true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        '/': (context) => _appCheck ? const SplashScreen() : const HomeScreen(),
        HomeScreen.routename: (context) => const HomeScreen(),
        AboutPg.routename: ((context) => const AboutPg()),
      },
    );
  }
}
