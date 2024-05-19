import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled2/form/palette.dart';

class Password extends StatefulWidget {
  final String name;
  final String label;
  final Color? color;
  final Widget? prefixIcon;
  final List<String? Function(dynamic)> validators;

  const Password({
    super.key,
    required this.name,
    this.label = '',
    this.color,
    this.prefixIcon,
    this.validators = const [],
  });

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        key: widget.key,
        name: widget.name,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isObscure,
        decoration: Palette.formFieldDecoration(
          label: widget.label,
          fillColor: widget.color,
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    right: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [widget.prefixIcon!],
                  ),
                )
              : null,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
        validator: FormBuilderValidators.compose(widget.validators),
      ),
    );
  }
}
