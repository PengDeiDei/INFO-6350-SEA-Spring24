import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
  This are services of a database that users store their weight records in the app.
  Each user's weight records are stored in a nested collection 'Weight' under user's
  document in 'Users' collection. In other words, each user has a self-owned 'Weight'
  collection for weight records.
*/

class WeightServices {
  // email of current logged in user as doc ID
  String? docId = FirebaseAuth.instance.currentUser!.email;

  // get collection of users from firebase
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');

  // get collection of weight records from firebase
  late CollectionReference records = users.doc(docId!).collection('Weights');

  // add a weight record
  Future<void> addRecord(String weight) {
    return records.add({
      'Weight': weight,
      'TimeStamp':Timestamp.now(),
    });
  }

  Future<void> updateWeight(String weight){
    return users.doc(docId).update({
      'weight': weight,
    });
  }

  // read weight records from firebase
  Stream<QuerySnapshot> getRecordsStream(){
    final recordsStream = records
      .orderBy('TimeStamp', descending: true)
      .snapshots();

    return recordsStream;
  }
}