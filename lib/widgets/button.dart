import 'package:flutter/material.dart';
import 'package:untitled2/utils/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: MaterialButton(
        onPressed: onPressed,
        color: Constants.primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
