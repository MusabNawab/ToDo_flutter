import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/data/models/task.dart';
import 'package:todo/presentation/screens/homescreen/widgets/list_tiles.dart';
import 'package:todo/presentation/screens/homescreen/widgets/no_tasks.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.listKey});
  final GlobalKey<AnimatedListState> listKey;
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>
    with SingleTickerProviderStateMixin {
  final box = AppConstants.localTaskBox;
  late AnimationController _animationController;

  //delete task
  void removeTask(dynamic key, int index, Task task) {
    box.delete(key); //remove for local storage
    //play fading animation
    widget.listKey.currentState!.removeItem(
        index,
        (context, animation) => FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: TodoListTiles(value: task, keys: key))),
        duration: const Duration(milliseconds: 500));
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween(begin: const Offset(0.0, 0.7), end: const Offset(0.0, 0.0))
              .animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
      child: ValueListenableBuilder<Box<Task>>(
        valueListenable: box.listenable(),
        builder: (context, box, child) {
          final key = box.keys.toList();
          final val = box.values.toList().cast<Task>();

          if (val.isEmpty) {
            return const NoTasks();
          }

          return AnimatedList(
            key: widget.listKey,
            initialItemCount: val.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: Slidable(
                    key: ValueKey(key[index]),
                    endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        dismissible: DismissiblePane(
                            onDismissed: () =>
                                removeTask(key[index], index, val[index])),
                        children: [
                          SlidableAction(
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (_) {
                                removeTask(key[index], index, val[index]);
                              })
                        ]),
                    child: TodoListTiles(
                      keys: key[index],
                      value: val[index],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
