// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  bool? isPassword;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  FormFieldSetter<String>? onsaved;
  TextInputAction? textAction;
  Color? borderColor;
  Color? disbledBorderColor;
  VoidCallback? onEditingComplete;
  VoidCallback? passwordFunction;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? isPasswordRevealed;
  bool? isEnabled = true;
  TextInputType? keyboardType;
  CustomTextField({
    Key? key,
    this.hint,
    this.onEditingComplete,
    this.isPassword,
    this.validator,
    this.controller,
    this.onsaved,
    this.textAction,
    this.isEnabled,
    this.borderColor = Colors.grey,
    this.disbledBorderColor = Colors.grey,
    this.passwordFunction,
    this.isPasswordRevealed,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      enabled: isEnabled,
      onEditingComplete: onEditingComplete,
      onSaved: onsaved,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      cursorColor: Theme.of(context).colorScheme.primary,
      textInputAction: textAction,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error, width: 1)),
        filled: true,
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: hint,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
