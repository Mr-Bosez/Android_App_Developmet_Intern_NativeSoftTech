import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key, required this.label, required this.textEditingController});
  final String errorMsg="Enter the details";
  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String?input){
        if(input!=null && input.isNotEmpty){
          return null;
        }
        else{
          return errorMsg;
        }

      },

      controller: textEditingController,
      decoration:InputDecoration(
          labelText: label,
          border: const OutlineInputBorder()
      ) ,
    );
  }
}
