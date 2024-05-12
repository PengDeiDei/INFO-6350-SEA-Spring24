import 'package:final_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Color(0xff786F72)),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: hintText,
        hintStyle: TextStyle(color: TColor.primaryColor1, fontSize: 14),
      ),
    );
  }
}