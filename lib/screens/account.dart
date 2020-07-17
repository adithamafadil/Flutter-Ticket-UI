import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/img1.jpg'),
            ),
            SizedBox(height: 36),
            RaisedButton(
              color: Color(0xFF205DC3),
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Color(0xFFF6F6F6),
                ),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }
}
