import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyToggleButton());
}

class MyToggleButton extends StatefulWidget{
  const MyToggleButton({super.key});

  @override
  State<MyToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<MyToggleButton> {
  bool isSwitched = false;
  String message = "";

  void toogleButton(){
    setState(() {
      isSwitched = !isSwitched;
      message = isSwitched? "Hello, good to see you!" : "Bye, see you next time!";
    });
  }

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('02-Create-a-Toggle-Button'),
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: toogleButton, child: Text('Click Me')),
              Text(
                message,
                style: 
                  TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}