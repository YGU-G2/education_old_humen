import 'package:get/get.dart';
import 'package:untitled2/pdf/pdf_screen.dart';
import 'package:untitled2/screens/home.dart';
import 'package:untitled2/screens/intro.dart';

class Routings {
  static List<GetPage> routings = [
    GetPage(
      name: Home.id,
      page: () => Home(),
    ),
    GetPage(
      name: Intro.id,
      page: () => Intro(),
    ),
    GetPage(
      name: PDFScreen.id,
      page: () => PDFScreen(),
    ),
  ];
}
