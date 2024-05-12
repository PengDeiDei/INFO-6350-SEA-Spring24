import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/main_drawer.dart';
import 'package:final_project/components/title_subtitle_cell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Future to fetch user details 
  Future<DocumentSnapshot <Map<String,dynamic>>> getUserDetails() async{
    return await FirebaseFirestore.instance.collection('Users')
      .doc(currentUser!.email).get();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: TColor.primaryColor2,
        elevation: 0,
        title: const Center(
          child: Text(
            "H O M E",
            style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w700),
          )
        ),
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<DocumentSnapshot <Map<String,dynamic>>>(
        future: getUserDetails(), 
        builder: (context, snapshot){
          // show loading circle
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error
          else if(snapshot.hasError){
            return Text("ERROR: ${snapshot.error}");
          }

          // data received
          else if(snapshot.hasData){
            // extract data
            Map<String, dynamic>? userData = snapshot.data!.data();

            // build content
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Glad to see you back,",
                          style: TextStyle(color: TColor.grey, fontSize: 18),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          userData!['username'],
                          style: TextStyle(
                            color: TColor.primaryColor1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Container(
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [BoxShadow( color: Colors.black12, blurRadius: 2 )]
                          ),
                          child: const Icon(Icons.person_2_rounded, size: 50),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: TColor.lightGray,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Details",
                            style: TextStyle(
                              color: TColor.primaryColor1,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,)
                            ),
                          
                          const SizedBox(height: 10,),

                          Row(
                            children: [
                              Expanded(
                                child:
                                  TitleSubtitleCell(
                                    title: userData['weight'],
                                    subtitle: "Weight (kg)",
                                  ),
                              ),
                              const SizedBox(width: 8,),
                              Expanded(
                                child: TitleSubtitleCell(
                                  title: userData['height'],
                                  subtitle: "Height (cm)",
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Expanded(
                                child: TitleSubtitleCell(
                                  title: userData['age'],
                                  subtitle: "Age",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          }

          else{
            return const Text("No Data Received");
          }
        },
      ),
    );
  }
}