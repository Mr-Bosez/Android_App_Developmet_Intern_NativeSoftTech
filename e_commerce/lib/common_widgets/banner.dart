import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final dWidth=MediaQuery.of(context).size.width;
    final dHeight=MediaQuery.of(context).size.height;
    return  Container(
        width: dWidth,
        height: dHeight*0.23,
        color: bannerColor,
        child:Padding(
          padding: EdgeInsets.only(left: 20),
          child:Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NEW COLLECTIONS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,letterSpacing: -1),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("20",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,letterSpacing: -3,height: 0),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: -3,height: 0),),
                          Text("OFF",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: -1.5,height: 0.8),),
                        ],
                      )
                    ],
                  ),
                  MaterialButton(
                    color: Colors.black,
                      elevation: 2,
                      onPressed: (){},
                    child: Text("SHOP NOW",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/girl_banner.png",height: dHeight* 0.30,),
              )
            ],
          ),

        ),
      );
  }
}
