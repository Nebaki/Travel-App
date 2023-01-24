import 'package:flutter/material.dart';
import 'package:travelapp/utils/colors.dart';
import 'package:travelapp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
   double? width;
   ResponsiveButton({Key? key,this.isResponsive=false,this.width=120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceAround:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(
              margin: EdgeInsets.only(left: 20),
                child: AppText(text:"Book trip now",color: Colors.white)):Container(),
            Image.asset("assets/button-one.png")
          ],
        ),
      ),
    );
  }
}
