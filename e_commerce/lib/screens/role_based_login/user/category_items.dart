import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/fcategory.dart';
import 'package:e_commerce/model/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/provider/favourite_provider.dart';
import '../../../router/app_router.dart';

@RoutePage()
class CategoryItemsScreen extends ConsumerStatefulWidget {
  final String selectedCategory;
  const CategoryItemsScreen({super.key, required this.selectedCategory});

  @override
  ConsumerState<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}
//  generating random values for reviews and rating for each item using itemID
 Map<String ,Map<String,dynamic>> randomValuesCache={}; // kept outside the class to make it constant ,whose value doesn't change once created

class _CategoryItemsScreenState extends ConsumerState<CategoryItemsScreen> {

  //Search controller
  TextEditingController searchController = TextEditingController();
  List<QueryDocumentSnapshot> allItems = [];
  List<QueryDocumentSnapshot> filteredItems = [];

  @override
  void initState() {
    searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchTerm = searchController.text.trim().toLowerCase();
    setState(() {
      filteredItems = allItems.where((item) {
        final data = item.data() as Map<String, dynamic>;
        final itemName = data["name"].toString().toLowerCase();
        return itemName.contains(searchTerm);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state=ref.watch(favouriteProvider);
    final notifier=ref.read(favouriteProvider.notifier); // favourite notifier
    final CollectionReference itemsCollection = FirebaseFirestore.instance
        .collection("items");
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 800,
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    letterSpacing: -1,
                  ),
                  hintText: "${widget.selectedCategory}'s Fashion",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.black12,
                  filled: true,
                  prefixIcon: Icon(Iconsax.search_normal),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(filterCategory.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index]),
                            SizedBox(width: 3),
                            index == 0
                                ? Icon(Icons.filter_list)
                                : Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(subCategoryList.length, (index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.greenAccent,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  subCategoryList[index].imgUrl,
                                ),
                                radius: 30,
                              ),
                            ),
                            Text(
                              subCategoryList[index].name,
                              style: TextStyle(fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: itemsCollection
                      .where("category", isEqualTo: widget.selectedCategory)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
                    if (snapShot.hasData) {
                      final items = snapShot.data!.docs;
                      if (allItems.isEmpty) {
                        allItems = items;
                        filteredItems = items;
                      }
                      if (filteredItems.isEmpty) {
                        return Center(child: Text("No products found"));
                      }
                      return GridView.builder(
                        itemCount: filteredItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.44,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 7,
                        ),
                        itemBuilder: (context, int index) {
                          final doc = filteredItems[index];
                          final item = doc.data() as Map<String, dynamic>;
                          final itemId = doc.id;
                          // check if random values are already cached
                          if(!randomValuesCache.containsKey(itemId)){
                            randomValuesCache[itemId]={
                              "rating":"${Random().nextInt(3)+2}.${Random().nextInt(10)}",
                              "reviews":"${Random().nextInt(500)+1}"
                            };
                          }

                          final cachedRating=randomValuesCache[itemId]!["rating"];
                          final cachedReviews=randomValuesCache[itemId]!["reviews"];
                          return GestureDetector(
                            onTap: () {
                              context.router.navigate(ItemDetailRoute(productItem: doc));
                            },
                            child: Container(
                              height: size.height * 0.47,
                              width: size.width * 0.5,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: Offset(3, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Hero(
                                        tag: itemId,
                                        transitionOnUserGestures: true,
                                        child: SizedBox(
                                          width: size.width * 0.5,
                                          height: size.height * 0.35,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            child: Image(
                                              image: CachedNetworkImageProvider(item["image"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () {
                                            notifier.toggleFavourite(items[index]);
                                          },
                                          child: Icon(
                                            state.isExist(items[index])?Icons.favorite:
                                            Icons.favorite_border_rounded,
                                            color:state.isExist(items[index])? Colors.red:Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 6,
                                      top: 6,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "SN",
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                          size: 18,
                                        ),
                                        Text(
                                          cachedRating.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "($cachedReviews)",
                                          style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 6,
                                      top: 6,
                                    ),
                                    child: Text(
                                      item["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  item["isDiscounted"]?
                                  Padding(
                                    padding: EdgeInsets.only(left: 6,top: 6),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$${(item["price"]*(1-item["discountPercentage"]/100)).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 2,),
                                        Text(
                                          "\$${item["price"]}.00",
                                          style: TextStyle(
                                            decoration: TextDecoration
                                                .lineThrough,
                                            decorationColor:
                                            Colors.black38,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ) :
                                  Padding(
                                    padding: EdgeInsets.only(left: 6,top: 6),
                                    child: Row(
                                      children: [
                                        Text(
                                          "\$${item["price"]}.00",
                                          style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (snapShot.hasError) {
                      return Center(child: Text("Error : ${snapShot.error}"));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
