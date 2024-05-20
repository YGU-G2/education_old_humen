import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/home.dart';
import 'package:untitled2/screens/intro.dart';
import 'package:untitled2/routes/routings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Home(),
      initialRoute: Intro.id,
      getPages: Routings.routings,
    );
  }

  Widget buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
      ),
    );
  }
}

