
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/constants.dart';
// class SearchBar extends StatelessWidget {
//   final width = double.infinity;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: searchDecoration,
//       padding: EdgeInsets.all(10.0),
//       height: 60.0,
//       width: width,
//       child: TextField(
//         decoration: InputDecoration(
//             border: InputBorder.none,
//           //   hoverColor:Colors.yellow,
//             suffixIcon:    Icon(
//               Icons.search,
//               color: basicColor,
//             ),
//             hintStyle: TextStyle(color: Colors.grey),
//             hintText: 'search your food'),
//
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         cursorColor: basicColor,
//         onChanged:(value){
//           searchId=value;
//         } ,
//         style: TextStyle(color: basicColor),
//       ),
//     );
//   }
// }
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final width = double.infinity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: searchDecoration,
      padding: EdgeInsets.all(10.0),
      height: 60.0,
      width: width,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
          //   hoverColor:Colors.yellow,
            suffixIcon:    Icon(
              Icons.search,
              color: basicColor,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'search your food'),

        keyboardType: TextInputType.text,
        autofocus: false,
        cursorColor: basicColor,
        onChanged:(value){
        if(value.isEmpty)
          {
            setState(() {
              searchId=value;
              isSearch=true;
            });
          }
        else
          {
            setState(() {
              searchId=value;
              isSearch=false;
            });
          }

        } ,
        style: TextStyle(color: basicColor),
      ),
    );
  }
}

