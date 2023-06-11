import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/screens/body.dart';
import 'package:todo/screens/splash_screen.dart';
import 'models/data_struct.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataStructAdapter());
  await Hive.openBox<DataStruct>('mybox');
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
      //home: const SplashScreen(),
      routes: {
        '/': (context) => const SplashScreen(),
        Body.routename: (context) => const Body(),
      },
    );
  }
}
