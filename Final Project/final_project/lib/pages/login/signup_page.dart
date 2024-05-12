import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/round_button.dart';
import 'package:final_project/components/round_textfield.dart';
import 'package:final_project/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final Function() togglePage;

  const SignupPage({
    super.key,
    required this.togglePage,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _confirmController = TextEditingController();
  final  _usernameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _confirmController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }

  // user login method 
  void userSignup() async{
    // show loading circle
    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),);

    if(_passwordController.text != _confirmController.text){
      // pop loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage('mismatched-password', context);
    } else {
      try{
        // create the user
        UserCredential? userCredential = 
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // create a user document and add to firestore
        createUserDocument(userCredential);

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

  Future<void> createUserDocument(UserCredential? userCredential) async{
    if(userCredential != null && userCredential.user != null){
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.email)
      .set({
        'email': _emailController.text.trim(),
        'username': _usernameController.text.trim(),
        'age': _ageController.text.trim(),
        'weight': _weightController.text.trim(),
        'height': _heightController.text.trim(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.width*0.01,),
                Text(
                  "Hello there,", 
                  style: TextStyle(color: TColor.black, fontSize: 20, fontWeight: FontWeight.w700),
                ),
        
                Text(
                  "create an account", 
                  style: TextStyle(color: TColor.grey, fontSize: 16,),
                ),
                
                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Username", 
                  controller: _usernameController, 
                  icon: const Icon(Icons.email, color: Color(0xff9DCEFF),),
                ),

                SizedBox(height: media.width*0.01,),
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
                
                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Confirm Password", 
                  controller: _confirmController, 
                  icon: const Icon(Icons.lock, color: Color(0xff9DCEFF),), 
                  obscureText: true
                ),

                SizedBox(height: media.width*0.01,),
                Text(
                  "Before you leave, let's know you better", 
                  style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Your Age", 
                  controller: _ageController, 
                  icon: const Icon(Icons.email, color: Color(0xff9DCEFF),),
                ),
        
                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Your Weight (kg)", 
                  controller: _weightController, 
                  icon: const Icon(Icons.lock, color: Color(0xff9DCEFF),), 
                ),
                
                SizedBox(height: media.width*0.01,),
                RoundTextField(
                  hintText: "Your Height (cm)", 
                  controller: _heightController, 
                  icon: const Icon(Icons.lock, color: Color(0xff9DCEFF),), 
                ),

                SizedBox(height: media.width*0.025,),
                RoundButton(title: "Register", type: RoundButtonType.colorType2, 
                  onPressed: userSignup,
                ),

                SizedBox(height: media.width*0.025,),
                TextButton(
                  onPressed: widget.togglePage,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account yet?",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        "Login",
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