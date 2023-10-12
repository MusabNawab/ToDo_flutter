import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.bottomSpacing,
      required this.handler});

  final String title;
  final IconData? icon;
  final Color color;
  final VoidCallback handler;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomSpacing),
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
