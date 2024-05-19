import 'package:flutter/material.dart';

class LessonesTwo extends StatelessWidget {
  const LessonesTwo({super.key});

  static String id = '/lessones_two';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدروس'),
        centerTitle: true,
      ),
    );
  }
}
