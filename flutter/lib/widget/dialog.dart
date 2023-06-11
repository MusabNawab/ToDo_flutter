import 'package:flutter/material.dart';
import '../models/boxes.dart';
import '../models/data_struct.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({super.key, required this.listkey});
  final GlobalKey<AnimatedListState> listkey;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    final val = TextEditingController();

    void addTask(String title, bool status) {
      final box = Boxes.getBox();
      final obj = DataStruct(title: title, status: status);
      box.add(obj);
      setState(() {});
      if (widget.listkey.currentState == null) {
        return;
      } else {
        widget.listkey.currentState!.insertItem(box.values.length - 1,
            duration: const Duration(seconds: 1));
      }
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Container(
        height: 130,
        width: 250,
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: val,
              maxLength: 50,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Title',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: Navigator.of(context).pop,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (val.text.isEmpty) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'Title cannot be empty',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Theme.of(context).primaryColor,
                      ));
                    } else {
                      addTask(val.text, false);
                      //data.sortList();
                      Navigator.of(context).pop();
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
