import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled2/form/palette.dart';

class Data extends StatelessWidget {
  final String name;
  final String? initialValue;
  final String label;
  final Color? color;
  final bool readOnly;
  final Widget? prefixIcon;
  final double? width;
  final List<String? Function(String?)> validators;

  const Data({
    super.key,
    required this.name,
    this.initialValue,
    this.label = '',
    this.color,
    this.readOnly = false,
    this.prefixIcon,
    this.validators = const [], this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FormBuilderTextField(
        key: key,
        name: name,
        style: const TextStyle(color: Colors.black),
        readOnly: readOnly,
        initialValue: initialValue,
        decoration: Palette.formFieldDecoration(
          label: label,
          fillColor: color,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    right: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [prefixIcon!],
                  ),
                )
              : null,
        ),
        validator: FormBuilderValidators.compose(validators),
      ),
    );
  }
}
