import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_app/Authentification/screens/cart_screen.dart';
import 'package:plant_app/Authentification/screens/home_screen.dart';
import 'package:plant_app/Authentification/screens/login_screen.dart';
import 'package:plant_app/Authentification/screens/main_screen.dart';
import 'package:provider/provider.dart';
import '/Authentification/screens/UserLinking.dart'; // Importer le UserController
import '/Authentification/screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserController(),
      child: ScreenUtilInit(
        designSize: Size(375, 812), // Mettez la taille de l'écran que vous utilisez dans votre design
        builder: (BuildContext context, Widget? widget) => const MyApp(), // Utiliser une fonction qui respecte la signature attendue
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        MainScreen.id: (context) => const MainScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        CartScreen.id: (context) => const CartScreen(),
      },
    );
  }
}
