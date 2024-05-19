import 'package:flutter/material.dart';
import 'package:untitled2/config/palette.dart';

class Palette {
  static Color bgColor = TerhalPalette.grey[50]!;

  static InputDecoration formFieldDecoration({
    String? label,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool filled = true,
    String? field,
    Color? fillColor,
  }) {
    return InputDecoration(      
      labelText: label,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: true,
      contentPadding: field == "check"
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: 10, vertical: prefixIcon != null ? 8 : 16),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      filled: filled,
      fillColor: fillColor ?? Palette.bgColor,
    );
  }
}
