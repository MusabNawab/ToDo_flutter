import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/adapters.dart';
import '../../widgets/drawer/mydrawer.dart';
import 'widgets/dialog.dart';
import 'widgets/todolist.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/body';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //close boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: const Text('To Do'),
        elevation: 0,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: kIsWeb ? 30 : 0),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogBox(
                      listkey: _key,
                    );
                  });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: TodoList(
        listKey: _key,
      ),
      floatingActionButton: kIsWeb
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogBox(
                        listkey: _key,
                      );
                    });
              },
              child: const Icon(Icons.add),
            )
          : null,
      drawer: const MyDrawer(),
    );
  }
}
