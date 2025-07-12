import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common_widgets/show_snackbar.dart';
import 'package:e_commerce/screens/role_based_login/admin/controller/add-item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common_widgets/my_button.dart';
import '../../../../common_widgets/textFormField.dart';
@RoutePage()
class AddItemsScreen extends ConsumerWidget {   //ConsumerWidget: A Riverpod widget that can read providers.
  AddItemsScreen({super.key});
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _productName=TextEditingController();
  final TextEditingController _productPrice=TextEditingController();
  final TextEditingController _productSize=TextEditingController();
  final TextEditingController _productColor=TextEditingController();
  final TextEditingController _productDiscountPercentage=TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    // ref: Riverpod’s reference to read/watch providers.
    // state: Holds the current state (e.g., selected image, categories, loading status).
    // notifier: Controller object that allows you to change the state.

    final state=ref.watch(addItemProvider);
    final notifier=ref.read(addItemProvider.notifier);
    // This ensures fetchCategory is called only once after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.categories.isEmpty) {
        notifier.fetchCategory();
      }
    });


    return  Scaffold(
      appBar: AppBar(
        title: Text("Add new items"),
        centerTitle:  true,
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: state.imagePath!=null?ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(File(state.imagePath!),filterQuality: FilterQuality.high,fit: BoxFit.cover,),
                    ):state.isLoading?CircularProgressIndicator():GestureDetector(
                      onTap: notifier.pickImage,
                      child: Icon(Icons.camera_alt,size: 30,),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextInputField(label: 'Name', textEditingController: _productName,),
                SizedBox(height: 10,),
                TextInputField(label: 'Price', textEditingController: _productPrice,),
                SizedBox(height: 10,),
                // for category selection
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "select category",
                    border: OutlineInputBorder()
                  ),
                    value: state.selectedCategory,
                    onChanged: notifier.setSelectedCategory,
                    items: state.categories.map((String category){
                      return DropdownMenuItem<String>(
                        value: category,
                          child:Text(category)
                      );
                    }).toList(),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _productSize,
                  decoration:InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Size (Comma seperated)',
                  ) ,
                  onFieldSubmitted: (value){
                    notifier.addSize(value);
                    _productSize.clear();
                  },
                ),
                Wrap(
                  spacing: 8,
                  children: state.sizes.map(
                          (size)=>Chip(
                            label: Text(size),
                            onDeleted:()=>notifier.removeSize(size),
                          )
                  ).toList(),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _productColor,
                  decoration:InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Color (Comma seperated)',
                  ) ,
                  onFieldSubmitted: (value){
                    notifier.addColor(value);
                    _productColor.clear();
                  },
                ),
                Wrap(
                  spacing: 8,
                  children: state.colors.map(
                          (color)=>Chip(
                        label: Text(color),
                        onDeleted:()=>notifier.removeColor(color),
                      )
                  ).toList(),
                ),
                Row(
                  children: [
                    Checkbox(
                        value:state.isDiscounted ,
                        onChanged: notifier.toggleDiscount
                    ),
                    Text("Apply discount"),
                  ],
                ),
                if(state.isDiscounted!)
                  TextFormField(
                    controller: _productDiscountPercentage,
                    decoration:InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText:  'Discount Percentage (%)',
                    ) ,
                    onChanged: (value){
                      notifier.setDiscountPercentage(value);
                    },
                  ),
                SizedBox(height: 10,),
                state.isLoading?Center(
                  child: CircularProgressIndicator(),
                ): Center(
                  child: MyButton(onTap: () async {
                    try{
                      await notifier.uploadAndSaveItem(_productName.text, _productPrice.text);
                      if(!context.mounted) return;
                      showSnackBar(context, "Item added successfully");
                      context.router.pop();
                    }catch(e){
                      showSnackBar(context, "Error : $e");
                    }
                  },buttonText: 'Save item',),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
