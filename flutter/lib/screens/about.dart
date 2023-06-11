import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo/screens/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPg extends StatelessWidget {
  const AboutPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Container(
        color: Colors.yellow.shade200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.account_circle,
                size: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  text: 'By: ',
                ),
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  text: "Musab Shaikh",
                ),
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  text: 'Email: ',
                ),
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  text: "musabnawabshaikh@gmail.com",
                ),
              ])),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  text: 'Github: ',
                ),
                TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    text: "github.com/MusabNawab",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        kIsWeb
                            ? await launchUrl(
                                Uri.parse("https://github.com/MusabNawab"))
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WebbView(
                                  title: 'GitHub',
                                ),
                              ));
                      }),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
