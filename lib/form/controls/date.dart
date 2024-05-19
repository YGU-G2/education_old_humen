import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/form/palette.dart';

class Date extends StatelessWidget {
  final String name;
  final String label;
  final DateTime? initialValue;
  final Color? color;
  final bool enabled;
  final Widget? prefixIcon;
  final List<String? Function(DateTime?)> validators;
  final double? width;

  const Date({
    super.key,
    required this.name,
    this.label = '',
    this.initialValue,
    this.color,
    this.enabled = true,
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
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: FormBuilderDateTimePicker(
        key: key,
        name: name,
        inputType: InputType.date,
        enabled: enabled,
        initialValue: initialValue,
        format: DateFormat('yyyy-MM-dd'),
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
