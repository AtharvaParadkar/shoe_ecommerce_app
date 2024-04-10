import 'package:shoe_ecommerce_app/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.ts,
    this.validator,
    this.keyboard,
    this.suffixIcon,
    this.obscureText,
    this.onEditingComplete,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onEditingComplete;
  final TextInputAction ts;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: TextField(
          keyboardType: keyboard,
          obscureText: obscureText ?? false,
          onEditingComplete: onEditingComplete,
          textInputAction: ts,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconColor: Colors.black,
              hintStyle: appstyle(16, Colors.grey, FontWeight.w500),
              contentPadding: EdgeInsets.zero,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              border: InputBorder.none),
          controller: controller,
          cursorHeight: 20,
          cursorRadius: const Radius.circular(30),
          cursorColor: Colors.black,
          style: appstyle(14, Colors.black, FontWeight.w500),
          onSubmitted: validator),
    );
  }
}
