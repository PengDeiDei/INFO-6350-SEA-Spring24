import 'package:final_project/pages/login/login_page.dart';
import 'package:final_project/pages/login/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPageControl extends StatefulWidget {
  const LoginPageControl({super.key});

  @override
  State<LoginPageControl> createState() => _LoginPageControlState();
}

class _LoginPageControlState extends State<LoginPageControl> {
  // toggle factor
  bool isLoginPage = true;


  void togglePage(){
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build (BuildContext context) {
    if(isLoginPage){
      return LoginPage(togglePage: togglePage);
    }else{
      return SignupPage(togglePage: togglePage);
    }
  }
}