import 'package:flutter/material.dart';

import 'pages/signUp.dart';
import 'pages/login.dart';
import 'pages/forgotPassword.dart';
import 'pages/home.dart';

import 'pages/categorieList.dart';
import 'pages/categorieFiltre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //home: const Page(title: 'Connexion'),
      //home: SignUpPage(),
      //home: LoginPage(),
      //home: ForgotPasswordPage(),
      //home: HomePage(),s
      //home: CategoryListPage(),
      //home: CategoryFilterPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage(),
        '/categorieList': (context) => CategoryListPage(),
        '/categorieFiltre': (context) => CategoryFilterPage(),
      },
    );
  }
}
