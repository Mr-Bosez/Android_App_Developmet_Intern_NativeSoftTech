import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common_widgets/my_button.dart';
import 'package:e_commerce/common_widgets/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
@RoutePage()
class PaymentAddMethodScreen extends StatefulWidget {
  const PaymentAddMethodScreen({super.key});

  @override
  State<PaymentAddMethodScreen> createState() => _PaymentAddMethodScreenState();
}

class _PaymentAddMethodScreenState extends State<PaymentAddMethodScreen> {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _userNameController=TextEditingController();
  final TextEditingController _cardNumberController=TextEditingController();
  final TextEditingController _balanceController=TextEditingController();
  final maskFormatter=MaskTextInputFormatter(
    mask: "**** **** **** ****",//defines the pattern
    filter: {"*":RegExp(r'[0-9]')} // allows only digits from 0-9
  );

  double balance=0.0;

  String ?selectedPaymentSystem;
  Map<String,dynamic>?selectedPaymentSystemData;
  Future <List<Map<String,dynamic>>> fetchPaymentSystems() async{
    QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("payment_methods").get();
    return snapshot.docs.map((doc)=>{
      'name':doc['name'],
      'image':doc['image']
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add payment Method"),
        centerTitle: true,
      ),
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: FutureBuilder(
                          future: fetchPaymentSystems(),
                          builder: (context,snapShot){
                            if(snapShot.hasError){
                              return Text("Error:${snapShot.error}");
                            }
                            if(!snapShot.hasData|| snapShot.data!.isEmpty){
                              return Text("No payment Methods found");
                            }
                            if(snapShot.connectionState==ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator());
                            }
                            return DropdownButton<String>(
                              elevation: 2,
                                value: selectedPaymentSystem,
                                hint: Text("Select the payment method"),
                                items: snapShot.data!.map((system){
                                  return DropdownMenuItem<String>(value:system['name'],
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(imageUrl: system['image'],width: 30,height: 30,errorWidget: (context,stackTrace,error)=>Icon(Icons.broken_image),),
                                          SizedBox(width: 10,),
                                          Text(system['name'])
                                        ],
                                      )
                                  );
                                }).toList(),
                                onChanged: (value){
                                setState(() {
                                  selectedPaymentSystem=value;
                                  selectedPaymentSystemData=snapShot.data!.firstWhere((system)=>system['name']==value);
                                });

                                });
                          },

                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _userNameController,
                      keyboardType:TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "eg.Bose",
                        labelText: "Card holder name",
                        border: OutlineInputBorder()
                      ),
                      validator: (String?value){
                        if(value==null|| value.isEmpty){
                          return "Provide the name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _cardNumberController,
                      keyboardType:TextInputType.number,
                      inputFormatters: [maskFormatter],
                      decoration: InputDecoration(
                        hintText: "1991 3XXX XXXX XXXX",
                        labelText: "Card Number",
                        border: OutlineInputBorder()
                      ),
                      validator: (String?value){
                        if(value==null|| value.replaceAll(" ", "").trim().length!=16){
                          return "The card must contain 16 digits";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _balanceController,
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "400",
                        labelText: "Balance",
                        prefixText: "\$",
                        border: OutlineInputBorder()
                      ),
                      validator: (String?value){
                        if(value==null){
                          return "Enter the balance";
                        }
                        return null;
                      },
                      onChanged: (value){
                        balance=double.tryParse(value)!;
                      },
                    ),
                    SizedBox(height: 10,),
                    MyButton(
                        onTap: ()=>addPaymentMethod(),
                        buttonText: "Add payment method")
                  ],
                )
            ),
          )
      ),
    );
  }
  void addPaymentMethod() async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    final userId=FirebaseAuth.instance.currentUser!.uid;
    if(selectedPaymentSystemData!=null){
      final paymentCollection=FirebaseFirestore.instance.collection("User Payment Method");
      // check the payment method already exist for this user
      final existingMethod=await paymentCollection.where('userId',isEqualTo: userId).where("paymentSystem",isEqualTo: selectedPaymentSystemData!['name']).get();
      if(!mounted) {
        return;
      }
      if(existingMethod.docs.isNotEmpty){
        return showSnackBar(context, "You have already added this payment method");
      }
      await paymentCollection.add({
        'userName':_userNameController.text.trim(),
        'cardNumber':_cardNumberController.text.trim(),
        'balance':balance,
        'userId':userId,
        'paymentSystem':selectedPaymentSystemData!['name'],
        'image':selectedPaymentSystemData!['image'],
      });
      if(!mounted){
        return;
      }
      showSnackBar(context, "Payment method successfully added");
      context.router.pop();
    }else{
      showSnackBar(context, "Failed to add payment method, try again");
    }
  }

}
