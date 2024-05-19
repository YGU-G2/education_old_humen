import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled2/form/palette.dart';

class Select extends StatelessWidget {
  final String name;
  final String? initialValue;
  final bool enabled;
  final String label;
  final Color? color;
  final List options;
  final Widget? prefixIcon;
  final double? width;
  final List<String? Function(dynamic)> validators;

  const Select({
    super.key,
    required this.name,
    required this.options,
    this.initialValue = '',
    this.enabled = true,
    this.label = '',
    this.color,
    this.prefixIcon,
    this.validators = const [], this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
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
        child: FormBuilderDropdown(  
          dropdownColor: Colors.white70,                            
          key: key,
          name: name,
          enabled: enabled,
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
          initialValue: initialValue,
          validator: FormBuilderValidators.compose(validators),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          elevation: 0,
          items: options.toSet().toList().map<DropdownMenuItem>((option) {
            return DropdownMenuItem(value: option, child: Text(option ?? ''));
          }).toList(),
        ),
      ),
    );
  }
}
