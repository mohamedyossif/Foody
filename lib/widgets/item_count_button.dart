import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemCountButton extends StatelessWidget {
  ItemCountButton({this.function, this.icon});
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: this.function,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Icon(
              this.icon,
              color: const Color(0xffF54749),
              size: 40,
            ),
          )),
    );
  }
}


