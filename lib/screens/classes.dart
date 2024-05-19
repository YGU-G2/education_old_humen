import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/pdf/pdf_screen.dart';
import 'package:untitled2/screens/lessones.dart';

class Classes extends StatelessWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "المراحل التعلمية",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            // spacing: 100,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: (Get.width / 2) - 10,
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Lessones.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.looks_one_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const Text(
                            "المرحلة الأولى",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: (Get.width / 2) - 10,
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.looks_two_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const Text(
                            " المرحلة الثانية",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: (Get.width / 2) - 10,
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.looks_3_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const Text(
                            "المرحلة الثالة",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: (Get.width / 2) - 10,
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.looks_4_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const Text(
                            "المرحلة الرابعة",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: (Get.width / 2) - 10,
                child: Card(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.looks_5_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          const Text(
                            "المرحلة الخامسة",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
