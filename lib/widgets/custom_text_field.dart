import 'package:flutter/material.dart';
import 'package:test_psi/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String formProperty;
  final Map<String, String> formValues;
  final String? Function(String?)? validador;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    required this.isPassword,
    required this.formProperty,
    required this.formValues,
    this.validador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "",
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: validador,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppTheme.inputFocusBorder,
      style: const TextStyle(color: AppTheme.text, fontFamily: "Regular"),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        icon: icon == null ? null : Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppTheme.inputFocusBorder, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppTheme.inputErrorBorder, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
