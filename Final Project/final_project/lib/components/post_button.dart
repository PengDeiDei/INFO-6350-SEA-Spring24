import 'package:final_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;
  const PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: TColor.primaryColor2,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(left: 10.0),
        child: const Center(
          child: Icon(Icons.add, color: Colors.black54, size: 20,),
        ),
      ),
    );
  }
}