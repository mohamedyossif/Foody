import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.text, @required this.function});
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffF54749),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(0, 15), //(x,y)
                blurRadius: 25,
              ),
            ],
            borderRadius: BorderRadius.circular(15.0)),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xffEAEAEA),
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}