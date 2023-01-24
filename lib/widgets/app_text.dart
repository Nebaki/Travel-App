// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
 double size;
   String text;
    Color color=Colors.black;
  AppText({Key? key,this.size=16,this.color=Colors.black54,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,


      ),
    );
  }
}
