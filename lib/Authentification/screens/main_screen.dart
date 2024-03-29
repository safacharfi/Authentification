import 'package:flutter/material.dart';
import 'package:plant_app/Authentification/components/bottom_nav_bar.dart';
import 'package:plant_app/Authentification/constants.dart';
import 'package:plant_app/Authentification/screens/cart_screen.dart';
import 'package:plant_app/Authentification/screens/home_screen.dart';
import '/Authentification/profile/profile.dart'; // Importez la page de profil

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String id = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    MyHomePage(
        title: "Mon profil"), // Ajoutez la page de profil à la liste des écrans
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        selectedColor: kDarkGreenColor,
        unselectedColor: kSpiritedGreen,
        onTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.image_search_outlined),
          Icon(Icons.receipt),
          Icon(Icons.person),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
