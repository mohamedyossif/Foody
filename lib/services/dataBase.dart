import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabaseMethods {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  void upLoadProfile(Map<String, dynamic> userInfo) {
    _fireStore.collection('users').add(userInfo);
  }
}