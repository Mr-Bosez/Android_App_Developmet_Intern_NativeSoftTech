import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/show_snackbar.dart';
@RoutePage()
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final userId=FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
        centerTitle: true,
      ),
      body: SizedBox(
        height:double.maxFinite ,
        width: double.maxFinite,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("User Payment Method").where("userId",isEqualTo:userId).snapshots(),
            builder: (context,snapShot){
              if(!snapShot.hasData){
                return Center(child: Text("Add a payment method"),);
              }
              if(snapShot.connectionState==ConnectionState.waiting){
                return  Center(child: CircularProgressIndicator(),);
              }
              final methods=snapShot.data!.docs;
              return ListView.builder(
                itemCount: methods.length,
                  itemBuilder: (context,int index){
                  final method=methods[index];
                  return ListTile(
                    leading: CachedNetworkImage(imageUrl: method['image'],height: 50,width: 50,),
                    title: Text(method['paymentSystem']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Activate",style: TextStyle(color: Colors.green),),
                        Text("\$ ${method['balance']}",style: TextStyle(color: Colors.red),)
                      ],
                    ),

                    trailing: MaterialButton(onPressed: (){
                      _showAddFundDialog(context, method);
                    },child: Text("Add fund"),),
                  );
                  }
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 1,
          child: Icon(Icons.add,size: 30,),
          onPressed: (){
          context.router.navigate(PaymentAddMethodRoute());
          }
      ),
    );
  }

  void _showAddFundDialog(BuildContext context,DocumentSnapshot record){
    TextEditingController _amount=TextEditingController();
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Add funds"),
          content: TextField(
            controller: _amount,
            decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixText: "\$",
                border: OutlineInputBorder(),
                hintText:"Enter the amount",
                labelText: "Amount"
            ),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  context.router.pop();
                },
                child: Text("Cancel")
            ),
            TextButton(
                onPressed: ()async{
                  final amount=double.tryParse(_amount.text);
                  if(amount==null|| amount<=0){
                    showSnackBar(context, "Please enter a valid amount");
                    return;
                  }
                  try{
                    record.reference.update({
                      "balance":FieldValue.increment(amount),
                    });
                    context.router.pop();
                    showSnackBar(context, "Fund added successfully");

                  }catch(exception){
                    showSnackBar(context, "Error at adding funds :$exception");
                  }
                },
                child: Text("Add")
            ),
          ],
        )
    );
  }
}
