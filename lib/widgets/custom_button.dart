import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    this.text,
    this.function,
  });

  final String text;
  final VoidCallback function;
  bool isLoading = false;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xffF54749), borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          widget.text,
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
