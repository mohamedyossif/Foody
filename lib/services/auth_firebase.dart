import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/widgets/custom_snackBar.dart';

class AuthFirebaseMethods {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPassword(context, email, password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        buildSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        buildSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
