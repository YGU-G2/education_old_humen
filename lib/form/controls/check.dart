import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled2/utils/constants.dart';

class Check extends StatelessWidget {
  final String name;
  final bool? initialValue;
  final bool enabled;
  final String title;
  final Color? color;
  final Color? textColor;
  final List<String? Function(bool?)> validators;

  const Check({
    super.key,
    required this.name,
    this.initialValue,
    this.enabled = true,
    this.title = '',
    this.color,
    this.textColor,
    this.validators = const [],
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      key: key,
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      title: Text(title, style: TextStyle(color: textColor)),
      activeColor: Constants.primaryColor,
      validator: FormBuilderValidators.compose(validators),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: color != null,
        fillColor: color,
      ),
    );
  }
}
