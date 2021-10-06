import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabaseMethods {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  /// store data
  void upLoadProfile(Map<String, dynamic> userInfo, String username) {
    _fireStore.collection('users').doc(username).set(userInfo);
  }

  /// search by username
  Future searchUserName(String userName) {
    return  _fireStore
        .collection('users')
        .where('username', isEqualTo: userName)
        .get()
        .then((value)=>value.docs.length);
  }
}
