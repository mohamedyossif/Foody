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
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xffF54749), borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xffEAEAEA),
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
