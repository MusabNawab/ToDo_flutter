import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/widget/todolist.dart';
import '../models/data_struct.dart';
import '../widget/dialog.dart';
import '../widget/mydrawer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Body extends StatefulWidget {
  static const routename = '/body';
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  @override
  void initState() {
    final box = Hive.box<DataStruct>('mybox');
    if (Hive.box<DataStruct>('mybox').isEmpty) {
      box.put(
          1,
          DataStruct(
              title: 'Tap on \'+\' icon to add new task', status: false));
      box.put(
          2, DataStruct(title: 'Slide left to delete a task', status: false));
      box.put(
          3,
          DataStruct(
              title: 'Tap on check box (✓) to mark a task as completed',
              status: true));
    }

    super.initState();
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
      drawer: Drawer(
        backgroundColor: Colors.yellow.shade200,
        child: const MyDrawer(),
      ),
    );
  }
}
