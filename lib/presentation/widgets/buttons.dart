import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.handler,
      required this.color,
      required this.title});

  final VoidCallback handler;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handler,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
