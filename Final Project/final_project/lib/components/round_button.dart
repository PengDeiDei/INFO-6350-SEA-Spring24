import 'package:final_project/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { colorType1, colorType2 }

class RoundButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final RoundButtonType type;

  const RoundButton({
    super.key, 
    required this.title, 
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.type = RoundButtonType.colorType1,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: TColor.primaryGroup),
        borderRadius: BorderRadius.circular(25),
        boxShadow:const [ BoxShadow(
          color: Colors.black26,
          blurRadius: 0.5,
          offset: Offset(0, 0.5))]
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: TColor.primaryColor1,
        minWidth: double.maxFinite,
        color: type == RoundButtonType.colorType1? TColor.white : Colors.transparent,
        child: Text(
          title,
          style: TextStyle(
            color: type == RoundButtonType.colorType1? TColor.primaryColor1 : TColor.white,
            fontSize: fontSize,
            fontWeight: fontWeight)),
      )
    );
  }
}