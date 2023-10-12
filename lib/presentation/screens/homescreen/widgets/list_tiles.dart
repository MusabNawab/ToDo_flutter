import 'package:flutter/material.dart';
import 'package:todo/data/models/task.dart';
import '../../../../constants/constants.dart';

class TodoListTiles extends StatefulWidget {
  const TodoListTiles({super.key, required this.value, required this.keys});

  final dynamic keys;
  final Task value;

  @override
  State<TodoListTiles> createState() => _TodoListTilesState();
}

class _TodoListTilesState extends State<TodoListTiles> {
  final box = AppConstants.localTaskBox;

  //mark tasks as done or undone
  void changeStatus(Task task, bool status) async {
    setState(() {
      status = !status;
    });
    Task tempTask = Task(title: task.title, status: status);
    box.put(widget.keys, tempTask);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: 5,
        left: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.value.status
              ? Colors.grey
              : Theme.of(context).primaryColor),
      child: ListTile(
        leading: Checkbox(
            value: widget.value.status,
            activeColor: Colors.black,
            onChanged: (_) {
              changeStatus(widget.value, widget.value.status);
            }),
        title: Text(
          widget.value.title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              decoration: widget.value.status
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: Colors.red,
              decorationThickness: 2),
        ),
      ),
    );
  }
}
