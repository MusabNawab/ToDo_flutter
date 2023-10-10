import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/boxes.dart';
import 'package:todo/models/data_struct.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.listKey});
  final GlobalKey<AnimatedListState> listKey;
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>
    with SingleTickerProviderStateMixin {
  final box = Boxes.getBox();
  late AnimationController _animationController;
  void changeStatus(dynamic key, String title, bool status) {
    setState(() {
      status = !status;
    });
    DataStruct obj = DataStruct(title: title, status: status);
    box.put(key, obj);
  }

  void removeTask(dynamic key, int index) {
    box.delete(key);
    widget.listKey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: const Padding(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Card(
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    'Deleted',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )),
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
    Hive.close();
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
      child: ValueListenableBuilder<Box<DataStruct>>(
        valueListenable: Boxes.getBox().listenable(),
        builder: (context, box, child) {
          final key = box.keys.toList();
          final val = box.values.toList().cast<DataStruct>();
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
                            onDismissed: () => removeTask(key[index], index)),
                        children: [
                          SlidableAction(
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              onPressed: (_) {
                                removeTask(key[index], index);
                              })
                        ]),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 5,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: val[index].status
                              ? Colors.grey
                              : Theme.of(context).primaryColor),
                      child: ListTile(
                        title: Text(
                          val[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              decoration: val[index].status
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.red,
                              decorationThickness: 2),
                        ),
                        trailing: Checkbox(
                            value: val[index].status,
                            activeColor: Colors.black,
                            onChanged: (_) {
                              changeStatus(key[index], val[index].title,
                                  val[index].status);
                            }),
                      ),
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
