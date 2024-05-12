import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/round_button.dart';
import 'package:final_project/pages/auth_page.dart';
import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: TColor.white,
       body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: TColor.primaryGroup, 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight
          ),
        ),
        child:
          Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              Text(
                "Weight Tracker", 
                style: TextStyle(
                  color: TColor.black, 
                  fontSize: 36, 
                  fontWeight: 
                  FontWeight.w700),
              ),

              Text(
                "Keep Your Healthy Life",
                style: TextStyle(
                  color: TColor.grey, 
                  fontSize: 18, 
                  fontWeight: 
                  FontWeight.w700),
              ),

              const Spacer(),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RoundButton(title: "Get Started", onPressed: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const AuthPage())
                    );
                  }),
                )
              ),

              SizedBox(height: media.width * 0.1),
            ],
          ),
      )
    );
  }
}