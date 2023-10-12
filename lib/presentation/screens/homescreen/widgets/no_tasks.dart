import 'package:flutter/material.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "No tasks",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(child: Text("Add a new task by pressing + button")),
      ],
    );
  }
}
