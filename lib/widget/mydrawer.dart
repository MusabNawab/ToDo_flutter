import 'package:flutter/material.dart';
import 'package:todo/screens/about.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 65,
        ),
        Container(
          height: 30,
          width: 90,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Colors.orange),
          child: const Center(
            child: Icon(Icons.push_pin),
          ),
        ),
        Container(
          height: 70,
          width: 90,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: Colors.amber),
          child: const Center(
            child: Text(
              'To Do',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          color: Colors.yellow,
          child: ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'About',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const AboutPg();
                },
              ));
            },
          ),
        ),
      ],
    );
  }
}
