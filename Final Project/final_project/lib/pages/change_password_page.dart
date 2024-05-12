import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/main_drawer.dart';
import 'package:final_project/components/round_button.dart';
import 'package:final_project/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final  _passwordController = TextEditingController();
  final  _confirmController = TextEditingController();

  void changePassword() async{
    // show loading circle
    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),);

    if(_passwordController.text.isEmpty){
      // pop loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage('empty-password', context);

    } else if(_passwordController.text != _confirmController.text){
      // pop loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage('mismatched-password', context);
    } else {
      try{
        await FirebaseAuth.instance.currentUser!.updatePassword(_passwordController.text.trim());

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch(e){
        // pop loading circle
        Navigator.pop(context);

        // show error message
        showErrorMessage(e.code, context);
      }
    }
  }

  @override 
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: TColor.primaryColor2,
        elevation: 0,
        title: const Center(
          child: Text(
            "C H A N G E   P A S S W O R D",
            style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w700),
          )
        ),
      ),
      drawer: const MainDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: media.width*0.01,),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:  Color(0xff786F72)),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "New Password",
                hintStyle: TextStyle(color: TColor.primaryColor1, fontSize: 14),
              ),
            ),
      
            SizedBox(height: media.width*0.01,),
      
            TextField(
              controller: _confirmController,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:  Color(0xff786F72)),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: TColor.primaryColor1, fontSize: 14),
              ),
            ),

            SizedBox(height: media.width*0.01,),

            RoundButton(
              title: "Change", 
              type: RoundButtonType.colorType2, 
              onPressed: changePassword,
            ),
          ],
        ),
      ),
    );
  }
}