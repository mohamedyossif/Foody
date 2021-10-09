import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/constants.dart';

class FireStoreDatabaseMethods {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  /// store data
  void upLoadProfile(Map<String, dynamic> userInfo, String username) {
    _fireStore.collection('users').doc(username).set(userInfo);
  }

  /// get user information  from firebase
  Future getUserInformation(String username) {
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
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchEmail(
      String email) {
    return _fireStore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);
  }

  /// store cartItems in firebase
  Future storeCart(
      String username, Map<String, dynamic> cartInfo, String title) async {
       int perCount=0;
    List<QueryDocumentSnapshot<Map<String, dynamic>>> listOfitems =
        await _fireStore
            .collection('users')
            .doc(username)
            .collection('cart')
            .where('title', isEqualTo: title)
            .get()
            .then((value) => value.docs);
    if (listOfitems.length == 0&&count!=0) {
      _fireStore
          .collection('users')
          .doc(username)
          .collection('cart')
          .doc(title)
          .set(cartInfo);
    } else {
      if(count !=0){
      listOfitems[0].reference.update({
        'count': count.toString()
      });
      }
      else{
        listOfitems[0].reference.delete();
      }
    }
  }

  /// get cartItems in firestore
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCart(
      String username) {
    return _fireStore
        .collection('users')
        .doc(username)
        .collection('cart')
        .get()
        .then((value) => value.docs);
  }

  /// get delete cartItem
  void deleteCartItem(String username) {
    _fireStore
        .collection('users')
        .doc(username)
        .collection('cart')
        .get()
        .then((value) {
      for (DocumentSnapshot doc in value.docs) {
        doc.reference.delete();
      }
    });
  }
}
