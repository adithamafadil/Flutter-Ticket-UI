import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/login/loginpage.dart';
import './screens/login/register.dart';

void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/': (BuildContext context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HanShip Ticket",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F6F6),
        fontFamily: "Oxygen",
      ),
      routes: routes,
    );
  }
}
