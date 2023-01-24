import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/app_text.dart';

import '../utils/colors.dart';

class AppButton extends StatelessWidget {
   final Color color;
   String? text;
   IconData? icon;
  final Color backgroundcolor;
  double size;
  final Color bordercolor;
   bool? isIcon;
   AppButton({Key? key,required this.isIcon, this.text, this.icon, required this.color, required this.backgroundcolor, required this.size, required this.bordercolor}) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
              color:bordercolor
          ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor

      ),
      child: isIcon==false?Center(child: AppText(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
