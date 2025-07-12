import 'package:e_commerce/utils/colors_conversion.dart';
import 'package:flutter/material.dart';
class SizeAndColor extends StatefulWidget {
  final List<dynamic> colors;
  final List<dynamic> sizes;
  final Function(int) onColorSelected;
  final Function(int) onSizeSelected;
  final int ? selectedColorIndex;
  final int ? selectedSizeIndex;

  const SizeAndColor({super.key, required this.colors, required this.sizes, required this.onColorSelected, required this.onSizeSelected, required this.selectedColorIndex, required this.selectedSizeIndex});

  @override
  State<SizeAndColor> createState() => _SizeAndColorState();
}

class _SizeAndColorState extends State<SizeAndColor> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Colors"),
            SizedBox(
              width: size.width*0.45,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                    children:widget.colors.asMap().entries.map((entry){
                      final index=entry.key;
                      final color=entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor:getColorFromName(color),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                widget.onColorSelected(index);
                              });

                            },
                            child: index == widget.selectedColorIndex? Icon(
                                Icons.check,
                                size: 30,
                                weight: 1.2,
                                color:Colors.white
                            ):null,
                          ),
                        ),
                      );
                    }).toList()
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sizes"),
              SizedBox(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child:Row(
                      children:widget.sizes.asMap().entries.map((entry){
                        final index=entry.key;
                        final size=entry.value;
                        return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: AnimatedContainer(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: widget.selectedSizeIndex==index? Colors.black:Colors.white,),

                              duration:Duration(seconds: 1),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.onSizeSelected(index);
                                  });
                                },
                                child: Center(
                                  child:Text(size,style: TextStyle(color:index==widget.selectedSizeIndex?Colors.white:Colors.black,fontWeight: FontWeight.bold),) ,
                                ),
                              ),

                            )
                        );
                      }).toList(),
                    )
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
