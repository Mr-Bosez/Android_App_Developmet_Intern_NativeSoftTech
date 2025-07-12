import 'package:flutter/material.dart';
import 'package:weather_application/core/app_constants/app_constants.dart';
import 'package:weather_application/ui/commonwidgets/title_text_widget.dart';
class DisplayError extends StatelessWidget{
  final String errorText;
  const DisplayError({super.key,this.errorText=ApplicationConstants.kWentWrongMessage});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 400,
              width: 300,
              child:Image.asset("assets/images/somethingWentWrong.png.png",filterQuality: FilterQuality.high,fit: BoxFit.cover,) ,
            ),
          ),

          TitleTextWidget(textToShow: errorText,textColor: Colors.red,)
        ],
      ),
    );

  }
}