import 'package:flutter/material.dart';

class Alphapet extends StatelessWidget {
  const Alphapet({
    super.key,
    required this.alpha,
    // required this.audioPath,
  });

  final String alpha;
  // final String audioPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 30,
          ),
          child: Text(
            alpha,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
