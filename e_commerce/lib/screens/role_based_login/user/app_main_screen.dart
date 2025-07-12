import 'package:auto_route/annotations.dart';
import 'package:e_commerce/screens/role_based_login/user/user%20Profile/user_profile.dart';
import 'package:e_commerce/screens/role_based_login/user/user_activity/user_favourites.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'app_home_screen.dart';
@RoutePage()
class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex=0;
  final List pages=[
    AppHomeScreen(),
    UserFavouriteScreen(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
          elevation: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.shifting,
          onTap: (value){
            setState(() {
              selectedIndex=value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Iconsax.heart),label: "Favourites"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label: "Profile")
          ],
      ),
      body: pages[selectedIndex],
    );
  }
}
