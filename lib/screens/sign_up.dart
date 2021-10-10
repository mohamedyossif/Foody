import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/services/shared_preferences.dart';
import 'package:food_app/widgets/custom_button.dart';
import 'package:food_app/widgets/custom_snackBar.dart';
import '../widgets/custom_text_field.dart';
import '../services/providers/sign_provider.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';

int resultOfUserName = 0;
int resultOfEmail = 0;

class SignUpScreen extends StatelessWidget {
  static const String id = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
        create: (_) => SignUpProvider(), child: SignUpDetails());
  }
}

class SignUpDetails extends StatelessWidget {
  TextEditingController _userName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// check username and email are valid or not.
  checkUsersName() async {
    await fireStoreDatabaseMethods
        .searchUserName(_userName.text)
        .then((value) => resultOfUserName = value);
  }

  checkEmail() async {
    await fireStoreDatabaseMethods
        .searchEmail(_email.text)
        .then((List<QueryDocumentSnapshot> value) => resultOfEmail = value.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: Provider.of<SignUpProvider>(context).isLoading,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                      color: const Color(0xffD4361C), fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset('assets/images/deliveryman.jpg')),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _userName,
                        validator: MultiValidator([RequiredValidator(errorText: "Required")]),
                        icon: Icons.person,
                        labelText: 'Username',
                      ),
                      CustomTextField(
                        controller: _address,
                        validator: RequiredValidator(errorText: "Required"),
                        icon: Icons.home,
                        labelText: 'Address',
                      ),
                      CustomTextField(
                        controller: _phone,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          MinLengthValidator(11, errorText: "enter a valid mobile number"),
                          MaxLengthValidator(11, errorText: "enter a valid mobile number"),
                        ]),
                        icon: Icons.phone,
                        labelText: 'Mobile number',
                      ),
                      CustomTextField(
                        controller: _email,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          EmailValidator(errorText: "Please enter a valid email address"),
                        ]),
                        icon: Icons.email,
                        labelText: 'Email',
                      ),
                      CustomTextField(
                        controller: _password,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                          MinLengthValidator(6,
                              errorText: "Password must contain at least 6 characters"),
                          MaxLengthValidator(15,
                              errorText: "Password cannot be more 15 characters"),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText: "Password must have at least one special character"),
                        ]),
                        icon: Icons.lock,
                        labelText: 'Password',
                        obscure: true,
                        prefix: Icons.remove_red_eye_outlined,
                      ),
                    ],
                  ),
                ),
                Consumer<SignUpProvider>(builder: (_, value, child) {
                  return CustomButton(
                      text: 'Sign Up',
                      function: () async {
                        await checkUsersName();
                        await checkEmail();

                        ///check user or email is exist or not
                        if (resultOfUserName != 0 && resultOfEmail != 0) {
                          buildSnackBar(context, 'Email and username are not available');
                        } else if (resultOfUserName != 0) {
                          buildSnackBar(context, 'Username is not available');
                        } else if (resultOfEmail != 0) {
                          buildSnackBar(context, 'Email is not available');
                        } else if (_formKey.currentState.validate()) {
                          Provider.of<SignUpProvider>(context, listen: false).loading();
                          await authFirebaseMethods.signUpWithEmailAndPassword(
                              _email.text, _password.text);

                          /// save state of screen
                          SharedPreferencesDatabase.saveUserLoggedInKey(true);
                          await SharedPreferencesDatabase.saveUserNameKey(_userName.text);
                          await SharedPreferencesDatabase.saveAddressKey(_address.text);
                          Map<String, dynamic> userInfo = {
                            'address': _address.text,
                            'email': _email.text,
                            'phone': _phone.text,
                            'username': _userName.text,
                          };

                          ///store ur data in FireStore
                          fireStoreDatabaseMethods.upLoadProfile(userInfo, _userName.text);

                          Navigator.pushReplacementNamed(context, HomeScreen.id);
                          Provider.of<SignUpProvider>(context, listen: false).signed();
                        }
                      });
                })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
