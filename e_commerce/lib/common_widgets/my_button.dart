import'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color ? color;
  const MyButton({super.key, required this.onTap, required this.buttonText, this.color=Colors.blueAccent,});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10)
          )
        ),
        child: Text(buttonText,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)
    );
  }
}
