import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod/riverpod.dart';

import '../model/states/add_item_model.dart';

// State Notifier Setup (Riverpod)
final addItemProvider=StateNotifierProvider<AddItemNotifier,AddItemState>((ref){
  return AddItemNotifier();
});

//The StateNotifier Class
class AddItemNotifier extends StateNotifier<AddItemState>{
  AddItemNotifier():super(AddItemState());  //super(AddItemState()): Initializes the state with default values.

  // for storing all the items in this collection
  final CollectionReference items=FirebaseFirestore.instance.collection("items");
  // for category
  final CollectionReference categoriesCollection=FirebaseFirestore.instance.collection("category");


  // for image picker
  void pickImage()async{
    try{
      final pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedFile!=null){
        state=state.copyWith(imagePath:pickedFile.path);   //In a StateNotifier<T>, the variable state represents the current state of the app (or screen), where T is your state class — in this case, AddItemState.
        print("Image picked successfully. Path: ${pickedFile.path}");
      }
    }catch(e){
      throw Exception("Error picking item $e");
    }
  }

  // to select category items
  void setSelectedCategory(String? category){
    state=state.copyWith(selectedCategory: category);
  }

  // for size
  void addSize(String size){
    state=state.copyWith(sizes:[...state.sizes,size] );
  }

  // ✅ Purpose of ...state.sizes, size
  // It means:
  // "Create a new list with all elements of state.sizes, and then add the new size to the end."
  // 🧠 Why is it necessary?
  // Because you're working with immutable state using freezed + Riverpod, you cannot modify the existing list directly.
  // Instead, you must create a new list. ...state.sizes copies all existing sizes, and size adds the new one.

  void removeSize(String size){
    state=state.copyWith(sizes: state.sizes.where((s)=>s!=size).toList());
  }

  // for color
  void addColor(String color){
    state=state.copyWith(colors: [...state.colors,color]);
  }
  void removeColor(String color){
    state=state.copyWith(colors: state.colors.where((s)=>s!=color).toList());
  }

  // for discount
  void toggleDiscount(bool? isDiscount){
    state=state.copyWith(isDiscounted: isDiscount);
  }
  void setDiscountPercentage(String percentage){
    state=state.copyWith(discountPercentage: percentage);
  }

  // to handle the loading indicator
  void setLoading(bool isLoading){
    state=state.copyWith(isLoading: isLoading);
  }

  // to fetch the category item
  Future<void>fetchCategory()async {
    try{
      QuerySnapshot snapshot=await categoriesCollection.get();
      List<String>categories=snapshot.docs.map((doc)=>doc["name"].toString()).toList();
      state=state.copyWith(categories: categories);

    }catch(e){
      throw Exception("Error savind item $e");
    }
  }

  // to upload and save the items
  Future<void>uploadAndSaveItem(String name,String price)async{
    if(name.isEmpty||
        price.isEmpty||
        state.imagePath==null||
        state.selectedCategory==null||
        state.sizes.isEmpty||
        state.colors.isEmpty||
        (state.isDiscounted!&& state.discountPercentage==null)
    ){
      throw Exception("Please fill all details and upload an image");
    }

    state=state.copyWith(isLoading: true);
    try{
      // upload the image to firebase storage
      final filename=DateTime.now().microsecondsSinceEpoch.toString();
      final reference=FirebaseStorage.instance.ref().child('image/$filename');
      await reference.putFile(File(state.imagePath!));
      final imageUrl=await reference.getDownloadURL(); //After uploading, you get a public URL to access the image.

      //save item to the firestore
      final String uid=FirebaseAuth.instance.currentUser!.uid; //Gets the UID of the logged-in user (to track who uploaded the item).
      await items.add({
        'name':name,
        'price':int.tryParse(price),
        'image':imageUrl,
        'uploadedBy':uid,
        'category':state.selectedCategory,
        'size':state.sizes,
        'color':state.colors,
        'isDiscounted':state.isDiscounted,
        'discountPercentage':state.isDiscounted!?int.tryParse(state.discountPercentage!):0,
      });
      //Reset state after successfully uploded the data
      state=AddItemState();

    }catch(e){
      throw Exception("Error in save item $e");
    }finally{
      state=state.copyWith(isLoading: false);
    }
  }
}