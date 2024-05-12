import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/round_button.dart';
import 'package:final_project/components/round_textfield.dart';
import 'package:final_project/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function() togglePage;

  const LoginPage({
    super.key,
    required this.togglePage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // user login method 
  void userLogin() async{
    // try sign in
    try{
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: _emailController.text, 
          password: _passwordController.text,
      );
    } on FirebaseAuthException catch(e){
      showErrorMessage(e.code, context);
    }
  }

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width*0.05,),
                Text(
                  "Welcome back,", 
                  style: TextStyle(color: TColor.black, fontSize: 20, fontWeight: FontWeight.w700),
                ),

                Text(
                  "you've been missed", 
                  style: TextStyle(color: TColor.grey, fontSize: 16,),
                ),
                
                SizedBox(height: media.width*0.025,),
                RoundTextField(
                  hintText: "Email", 
                  controller: _emailController, 
                  icon: const Icon(Icons.email, color: Color(0xff9DCEFF),),
                ),

                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Password", 
                  controller: _passwordController, 
                  icon: const Icon(Icons.lock, color: Color(0xff9DCEFF),), 
                  obscureText: true
                ),
                
                SizedBox(height: media.width*0.025,),
                RoundButton(title: "Login", type: RoundButtonType.colorType2, 
                  onPressed: userLogin,
                ),

                SizedBox(height: media.width*0.025,),
                TextButton(
                  onPressed: widget.togglePage,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        "Register",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                        )
                    ],
                  )
                ),
              ],
            ),
          ) 
        ),
      ),
    );
  }
}