import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/constants/constants.dart';
import 'package:open_store/open_store.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../screens/aboutscreen/about.dart';
import '../buttons.dart';
import 'options.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void confirmation(BuildContext context) {
    final box = AppConstants.localTaskBox;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are You Sure!"),
          content: const Text("This will delete all the tasks"),
          backgroundColor: Colors.yellow,
          actions: [
            Button(
                handler: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
                title: "No"),
            Button(
                handler: () {
                  box.clear();
                  Navigator.pop(context);
                },
                color: Colors.red,
                title: "Yes"),
          ],
        );
      },
    );
  }

  void privacyPolicy(BuildContext context) async {
    final url = Uri.parse(
        "https://doc-hosting.flycricket.io/to-do-privacy-policy/d721e3d7-9a18-48bd-bd41-fd7b16b6940d/privacy");

    try {
      launchUrl(url);
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "No internet",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: Colors.yellow.shade200,
      child: Stack(children: [
        Positioned(
          top: 30,
          right: 10,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Options(
              icon: Icons.star_rate_rounded,
              color: Colors.black,
              title: "Rate this App",
              bottomSpacing: 20,
              handler: () async {
                await OpenStore.instance.open(
                  androidAppBundleId:
                      'com.todo', // Android app bundle package name
                );
              },
            ),
            Options(
              icon: Icons.policy,
              color: Colors.black,
              title: "Privacy & Policy",
              bottomSpacing: 20,
              handler: () {
                privacyPolicy(context);
              },
            ),
            Options(
              icon: Icons.info,
              color: Colors.black,
              title: "About",
              bottomSpacing: 10,
              handler: () {
                Navigator.pushNamed(context, AboutPg.routename);
              },
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Options(
              title: "Delete All Data",
              icon: Icons.delete_forever,
              color: Colors.red,
              bottomSpacing: 0,
              handler: () {
                confirmation(context);
              },
            ),
          ],
        ),
      ]),
    );
  }
}

// const SizedBox(
//           height: 65,
//         ),
//         Container(
//           height: 30,
//           width: 90,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(5), topRight: Radius.circular(5)),
//               color: Colors.orange),
//           child: const Center(
//             child: Icon(Icons.push_pin),
//           ),
//         ),
//         Container(
//           height: 70,
//           width: 90,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(5),
//                   bottomRight: Radius.circular(5)),
//               color: Colors.amber),
//           child: const Center(
//             child: Text(
//               'To Do',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
