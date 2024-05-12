import 'package:final_project/common/color_extension.dart';
import 'package:final_project/components/custom_listtile.dart';
import 'package:final_project/components/custom_textfield.dart';
import 'package:final_project/components/main_drawer.dart';
import 'package:final_project/components/post_button.dart';
import 'package:final_project/services/weight_records_services.dart';
import 'package:flutter/material.dart';

class WeightPage extends StatelessWidget {
  WeightPage({super.key});

  final _textController = TextEditingController();

  final services = WeightServices();

  void addRecord(){
    // only add record if the textfield is not empty
    if(_textController.text.isNotEmpty){
      String record = _textController.text;
      services.addRecord(record);
      services.updateWeight(record);
    }
    // clear the controller
    _textController.clear();
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
            "W E I G H T   T R A C K E R",
            style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w700),
          )
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          // TextField box for weight recording
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _textController,
                    hintText: "Make A New Record",
                  ),
                ),
            
                PostButton(onTap: addRecord),
              ],
            ),
          ),

          // Weight Records
          StreamBuilder(
            stream: services.getRecordsStream(),
            builder: (context, snapshot){
              // show loading circle
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            
              // get all records
              final records = snapshot.data!.docs;
            
              // no data
              if(snapshot.data == null || records.isEmpty){
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No Record... Let's make some records!"),
                  ),
                );
              }
              
              // return a list
              return Expanded(
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: records.length > 8? 8 : records.length,
                  itemBuilder: (context, index){
                    // get each individual record
                    final record = records[index];
                
                    // extract weight record and timestamp
                    String weight = record['Weight'];
                    String time = (record['TimeStamp' ]).toDate().toString();
                
                    return CustomListTile(title: weight, subtitle: time,);
                  },
                ),
              );
          }),  
        ],
      ),
    );
  }
}