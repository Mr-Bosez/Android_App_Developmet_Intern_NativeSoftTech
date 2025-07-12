import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget{
  final VoidCallback onButtonPress;
  const GoogleSignInButton({super.key,required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onButtonPress();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Google-Symbol.png",width: 50,height: 50,),
              SizedBox(width: 20,),
              Text("Sign in with Gmail",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}