import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/widgets/customized_info_item.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File image;
  List<IconData> icons = [Icons.person, Icons.phone, Icons.email, Icons.location_on];

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: image != null
                        ? Image.file(
                            image,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          )
                        : FlutterLogo(
                            size: 160,
                          ),
                  ),
                  Positioned(
                    child: GestureDetector(
                        onTap: () => pickImage(),
                        child: Icon(
                          Icons.camera_enhance,
                          size: 30.0,
                          color: basicColor,
                        )),
                    bottom: 1.0,
                    right: 5.0,
                  ),
                ],
              ),

              /// get user Information
              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: fireStoreDatabaseMethods.getUserInformation(usernameId),
                builder: (c, snapshot) =>
                snapshot.hasData
                    ? Column(
                        children: [
                          CustomizedInfoItem(
                            icon: Icons.person,
                            label: snapshot.data.data()['username'],
                          ),
                          CustomizedInfoItem(
                            icon: Icons.phone,
                            label: snapshot.data.data()['phone'],
                          ),
                          CustomizedInfoItem(
                            icon: Icons.email,
                            label: snapshot.data.data()['email'],
                          ),
                          CustomizedInfoItem(
                            icon: Icons.location_on,
                            label: snapshot.data.data()['address'],
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
