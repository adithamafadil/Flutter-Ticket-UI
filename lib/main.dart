import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/screens/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HanShip Ticket",
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F6F6),
        fontFamily: "Oxygen",
      ),
    );
  }
}
