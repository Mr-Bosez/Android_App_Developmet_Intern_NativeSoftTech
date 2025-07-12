import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common_widgets/show_snackbar.dart';
import 'package:e_commerce/core/provider/cart_provider.dart';
import 'package:e_commerce/router/app_router.dart';
import 'package:e_commerce/screens/role_based_login/user/user_activity/add_to_cart/widgets/cart_items.dart';
import 'package:e_commerce/utils/payment_method_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final TextEditingController _addressController=TextEditingController();
  String ? selectedPaymentMethodId;
  double?selectedPaymentMethodBalance;
  @override
  Widget build(BuildContext context) {
    final state=ref.watch(cartProvider);
    final carts=state.carts.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18,),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child:carts.isNotEmpty?
              ListView.builder(
                itemCount: carts.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,int index){
                    return Padding(
                        padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: (){},
                        onLongPress: (){
                          state.deleteCartItem(carts[index].productID);
                        },
                        child: CartItems(cart: carts[index]),
                      ),
                    );
                  }
              ):Center(child: Text("Your cart is empty",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),)
          ),
          if(carts.isNotEmpty)_buildSummarySection(context, state)
        ],
      ),
    );
  }
  Widget _buildSummarySection(BuildContext context,CartProvider cp){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text("Delivery",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Expanded(child: DottedLine()),
              SizedBox(width: 10,),
              Text("\$40",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: -1),)

            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text("Total order",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Expanded(child: DottedLine()),
              SizedBox(width: 10,),
              Text("\$${(cp.totalCart()).toStringAsFixed(2)}",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: -1),)

            ],
          ),
          SizedBox(height: 5,),
          MaterialButton(
              onPressed: (){
                _showOrderConfirmDialog(context, cp);
              },
            color: Colors.black,
            minWidth: MediaQuery.of(context).size.width-50,
            height: 70,
            elevation: 20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color:Colors.white,width: 2,style: BorderStyle.solid)),
            child: Text("Pay \$${(cp.totalCart()+40).toStringAsFixed(2)}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

  void _showOrderConfirmDialog(BuildContext context,CartProvider cp){
    String ?addressError;
    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(builder: (context,setDialogState){
            return AlertDialog(
              title: Text("Confirm your order !"),
              content: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListBody(
                      children: cp.carts.map((cartItem){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${cartItem.productData['name']} x ${cartItem.quantity}")
                          ],
                        );
                      }).toList(),
                    ),
                    Text("Total payable price : \$${(cp.totalCart()+40).toStringAsFixed(2)}"),
                    // payment methods
                    SizedBox(height:10),
                    Text("Select Payment Method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                    // require a payment method
                    PaymentMethodList(selectedPaymentMethodId: selectedPaymentMethodId, selectedPaymentMethodBalance: selectedPaymentMethodBalance, finalAmount: cp.totalCart()+40,
                        onPaymentMethodSelected: (p0,p1){
                              setDialogState((){
                                selectedPaymentMethodId=p0;
                                selectedPaymentMethodBalance=p1;
                              });
                        }),
                    // to add address
                    Text("Add Your delivery Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your address",errorText: addressError),),
                    SizedBox(height: 10,)

                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: (){
                  context.router.pop();
                }, child: Text("Cancel")),


                TextButton(onPressed: (){
                  if(selectedPaymentMethodId==null) {
                    showSnackBar(context, "Please select a payment Method");
                  } else if(selectedPaymentMethodBalance! < cp.totalCart()+40){
                    showSnackBar(context, "Insufficient balance in the selected card");
                  }
                  else if(_addressController.text.length<8){
                    setDialogState((){
                      addressError="Give the appropriate address";
                    });
                  }else{
                    _saveOrder(context,cp);
                  }
                }, child: Text("Confirm")),

              ],
            );
          });
        }
    );
  }

  void _saveOrder(BuildContext context,CartProvider cp) async{
    final userId=FirebaseAuth.instance.currentUser!.uid;
    cp.saveOrder(userId, context, selectedPaymentMethodId, cp.totalCart()+40, _addressController.text);
    showSnackBar(context, "Order placed successfully !");
    context.router.navigate(MyOrderRoute());
    // cp.reset();

  }
}
