import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/lessones_two.dart';

class DrawerBtn extends StatelessWidget {
  const DrawerBtn({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: SizedBox(
        width: Get.width / 1.5,
        child: TextButton(
          style: ButtonStyle(
            alignment: Alignment.centerRight,
          ),
          onPressed: () {
            Get.toNamed(LessonesTwo.id);
          },
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
