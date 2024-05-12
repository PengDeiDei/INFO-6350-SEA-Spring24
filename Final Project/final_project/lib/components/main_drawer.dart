import 'package:final_project/common/color_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void userSignout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: TColor.lightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                const DrawerHeader(
                  child: Icon(Icons.settings, color: Colors.black54,),
                ),
                
                const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.home, color: TColor.primaryColor2,),
                  title: Text("H O M E", style: TextStyle(color:  TColor.primaryColor1, fontSize: 16),),
                  onTap: (){
                    // pop drawer
                    Navigator.pop(context);

                    // navigate to home page
                    Navigator.pushNamed(context, 'home_page');
                  },
                ),

                const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.monitor_weight, color: TColor.primaryColor2,),
                  title: Text( 
                    "W E I G H T   T R A C K E R", 
                    style: TextStyle(color: TColor.primaryColor1, fontSize: 16),
                    ),
                  onTap: (){
                     // pop drawer
                    Navigator.pop(context);

                    // navigator to weight records page
                    Navigator.pushNamed(context, 'weight_page');
                  },
                ),

                const SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.lock_reset, color: TColor.primaryColor2,),
                  title: Text( 
                    "C H A N G E   P A S S W O R D", 
                    style: TextStyle(color: TColor.primaryColor1, fontSize: 16),
                    ),
                  onTap: (){
                     // pop drawer
                    Navigator.pop(context);

                    // navigator to weight records page
                    Navigator.pushNamed(context, 'change_password_page');
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.home, color: TColor.primaryColor2,),
              title: Text("S I G N   O U T", style: TextStyle(color:  TColor.primaryColor1, fontSize: 16),),
              onTap: (){
                // pop drawer
                Navigator.pop(context);
                
                userSignout();

                Navigator.pushNamed(context, 'main_page'); 
              },
            ),
          ),
        ],
      ),
    );
  }
}