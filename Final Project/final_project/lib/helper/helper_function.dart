import 'package:final_project/common/color_extension.dart';
import 'package:flutter/material.dart';

void showErrorMessage(String error, BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: TColor.white,
          title: Center(
            child: Text(
              error,
              style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        );
      }
    );
  }