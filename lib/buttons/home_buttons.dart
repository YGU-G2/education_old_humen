import 'package:flutter/material.dart';

class MyButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton('Button 1', Colors.blue),
            buildButton('Button 2', Colors.red),
            buildButton('Button 3', Colors.green),
            buildButton('Button 4', Colors.orange),
            buildButton('Button 5', Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        // primary: color,
        // onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
