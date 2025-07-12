import 'package:flutter/material.dart';

import '../../core/app_constants/app_constants.dart';
class CustomLoader extends StatelessWidget{
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: ApplicationConstants.brownColor,
          color: Colors.black,
        ),
      ),
    );
  }
}