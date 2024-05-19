import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/widgets/alphapet.dart';
import 'package:untitled2/widgets/drawer_btn.dart';

class Lessones extends StatelessWidget {
  const Lessones({super.key});

  static String id = "/lessones";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerBtn(
                title: 'الدرس الاول',
                icon: Icons.looks_one_rounded,
              ),
              DrawerBtn(
                title: 'الدرس الثاني',
                icon: Icons.looks_two_rounded,
              ),
              DrawerBtn(
                title: 'الدرس الثالث',
                icon: Icons.looks_3_rounded,
              ),
              DrawerBtn(
                title: 'الدرس الربع',
                icon: Icons.looks_4_rounded,
              ),
              DrawerBtn(
                title: 'الدرس الخامس',
                icon: Icons.looks_5_rounded,
              ),
              DrawerBtn(
                title: 'الدرس السادس',
                icon: Icons.looks_6_rounded,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('الدروس'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'الدرس الاول\nتعلم الحروف',
                    style: TextStyle(
                      fontFamily: '',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Wrap(
                  textDirection: TextDirection.rtl,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Alphapet(alpha: "أ"),
                    Alphapet(alpha: "ب"),
                    Alphapet(alpha: "ت"),
                    Alphapet(alpha: "ث"),
                    Alphapet(alpha: "ج"),
                    Alphapet(alpha: "ح"),
                    Alphapet(alpha: "خ"),
                    Alphapet(alpha: "د"),
                    Alphapet(alpha: "ذ"),
                    Alphapet(alpha: "ر"),
                    Alphapet(alpha: "ز"),
                    Alphapet(alpha: "س"),
                    Alphapet(alpha: "ش"),
                    Alphapet(alpha: "ص"),
                    Alphapet(alpha: "ض"),
                    Alphapet(alpha: "ط"),
                    Alphapet(alpha: "ظ"),
                    Alphapet(alpha: "ع"),
                    Alphapet(alpha: "غ"),
                    Alphapet(alpha: "ف"),
                    Alphapet(alpha: "ق"),
                    Alphapet(alpha: "ك"),
                    Alphapet(alpha: "ل"),
                    Alphapet(alpha: "م"),
                    Alphapet(alpha: "ن"),
                    Alphapet(alpha: "ه"),
                    Alphapet(alpha: "و"),
                    Alphapet(alpha: "ي"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
