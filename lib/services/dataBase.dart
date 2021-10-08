import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDatabaseMethods {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  /// store data
  void upLoadProfile(Map<String, dynamic> userInfo, String username) {
    _fireStore.collection('users').doc(username).set(userInfo);
  }
  /// get user information  from firebase
  Future getUserInformation(String username)
  {
    return _fireStore.collection('users').doc(username).get();
  }
  /// search by username
  Future searchUserName(String userName) {
    return _fireStore
        .collection('users')
        .where('username', isEqualTo: userName)
        .get()
        .then((value) => value.docs.length);
  }
  /// search by email
  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> searchEmail(String email) {
    return _fireStore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }
  /// store cartItems in firebase
  void storeCart(String username,Map<String,dynamic> cartInfo)
  {
    _fireStore.collection('users').doc(username).collection('cart').add(cartInfo);
  }
  /// get cartItems in firestore
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCart(String username)
  {
    return _fireStore.collection('users').doc(username).collection('cart').get().then((value) => value.docs);
  }
 /// get delete cartItem
 void deleteCartItem(String username)
 {
   _fireStore.collection('users').doc(username).collection('cart').get().then((value) {
     for (DocumentSnapshot doc in value.docs) {
       doc.reference.delete();
     }
   });
 }
}
