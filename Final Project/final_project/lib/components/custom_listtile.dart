import 'package:final_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(color: Colors.grey.shade200,
                            boxShadow: const [BoxShadow( color: Colors.black26, blurRadius: 2 )]),
        child: ListTile(
          title: Text(
            title, 
            style: TextStyle(
              color: TColor.primaryColor1, 
              fontSize: 15, 
              fontWeight: FontWeight.w500
            ),
          ),
          subtitle: Text(
            "@ $subtitle", 
            style: TextStyle(
              color: TColor.grey, 
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}