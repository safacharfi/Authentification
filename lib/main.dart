import 'package:flutter/material.dart';
import 'Authentification/screens/cart_screen.dart';
import 'Authentification/screens/home_screen.dart';
import 'Authentification/screens/login_screen.dart';
import 'Authentification/screens/main_screen.dart';
import 'Authentification/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'Authentification/screens/UserLinking.dart'; // Importer le UserController

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UserController(), // Initialiser le UserController en tant que Provider
      child: const MyApp(),
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
