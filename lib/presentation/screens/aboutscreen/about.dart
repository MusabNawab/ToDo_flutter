import 'package:flutter/material.dart';

class AboutPg extends StatelessWidget {
  const AboutPg({super.key});

  static const routename = '/about';
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
              const Text(
                "To Do",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      text: 'Version: ',
                    ),
                    TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      text: "1.0.0",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '2.0App Labs',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
              // const SizedBox(height: 10),
              // RichText(
              //     text: TextSpan(children: [
              //   TextSpan(
              //     style: TextStyle(
              //       color: Theme.of(context).colorScheme.onBackground,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //     ),
              //     text: 'Github: ',
              //   ),
              //   TextSpan(
              //       style: const TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 15,
              //           color: Colors.blue,
              //           decoration: TextDecoration.underline),
              //       text: "github.com/MusabNawab",
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () async {
              //           kIsWeb
              //               ? await launchUrl(
              //                   Uri.parse("https://github.com/MusabNawab"))
              //               : Navigator.of(context).push(MaterialPageRoute(
              //                   builder: (context) => WebbView(
              //                     title: 'GitHub',
              //                   ),
              //                 ));
              //         }),
              // ])),
            ],
          ),
        ),
      ),
    );
  }
}
