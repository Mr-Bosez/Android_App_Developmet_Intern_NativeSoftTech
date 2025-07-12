import 'package:flutter/material.dart';
class DisplayGridWidget extends StatelessWidget {
  final List<String> listOfString;
  final Function(String itemName) onGridClicked;
  const DisplayGridWidget({super.key,required this.listOfString,required this.onGridClicked});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2.3),
        itemCount: listOfString.length,
        itemBuilder: (BuildContext context,int index){
          String itemName=listOfString[index];
          return Card(
            elevation: 5,
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: GestureDetector(
              onTap: (){
                onGridClicked(itemName);
              },
              child: ListTile(
                leading: Icon(Icons.location_on,color: Colors.red,),
                title: Text(itemName),
              ),
            ),
          );
        }
    );
  }
}
