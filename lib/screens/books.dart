import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Widget buildPdfCard(String name) {
  return Container(
    height: 200.0,
    width: 160.0,
    child: Center(
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 100.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Center(
                child: ButtonBar(
                  children: [
                    TextButton(
                      child: const Text('فتح الكتاب'),
                      onPressed: () {
                        // Navigator.of(context).push()
                        SfPdfViewer.asset('audio/functions.pdf');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget showInRow(String name, String name1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildPdfCard(name),
      buildPdfCard(name1),
    ],
  );
}

class Books extends StatelessWidget {
  static String id = '/books';
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  showInRow('الكتاب الاول', 'الكتاب الثاني'),
                  showInRow('الكتاب الثالث', 'الكتاب الرابع'),
                  showInRow('الكتاب السادس', 'الكتاب الخامس'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
