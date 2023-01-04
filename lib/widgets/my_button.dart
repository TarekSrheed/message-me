import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({
    required this.title,
    required this.color,
    required this.onPressed,
  });
  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: MaterialButton(
          minWidth: 200,
          height: 42,
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
