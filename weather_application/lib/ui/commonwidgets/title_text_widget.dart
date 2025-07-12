import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget{
  final String textToShow;
  final Color textColor;
  const TitleTextWidget({super.key, required this.textToShow,this.textColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(textToShow,style: TextStyle(fontSize: 18,color: textColor),textAlign: TextAlign.center,);
  }

}