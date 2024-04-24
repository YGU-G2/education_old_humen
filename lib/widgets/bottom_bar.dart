import 'package:flutter/material.dart';
import 'package:untitled2/controllers/main_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.title,
    required this.icon,
    required this.pageNumber,
    required this.pageController,
    required this.color,
  });

  final String title;
  final IconData icon;
  final int pageNumber;
  final PageController pageController;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final mainController = MainController();
    return ZoomTapAnimation(
      onTap: () => mainController.goPage(pageNumber, pageController),
      child: Container(
        height: 50,
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
