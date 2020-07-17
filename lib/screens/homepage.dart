import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/data/database-helper.dart';
import 'package:flutter_hanship_ui/models/user.dart';
import 'package:flutter_hanship_ui/widgets/carousel_promo.dart';
import 'package:flutter_hanship_ui/widgets/main_menu.dart';
import 'package:flutter_hanship_ui/widgets/top_destination_widget.dart';
import 'package:flutter_hanship_ui/widgets/top_screen_widget.dart';

import 'account.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper db;
  User _user;

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            TopScreenWidget(height: .3),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .03,
                  horizontal: MediaQuery.of(context).size.width * .03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF205DC3).withAlpha(150),
                          ),
                          child: Builder(
                            builder: (context) => IconButton(
                                icon: Icon(Icons.person_outline),
                                color: Colors.white,
                                onPressed: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Account()))),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Hi, ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Lato',
                            ),
                            children: [
                              TextSpan(
                                text: 'User',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF205DC3).withAlpha(150),
                          ),
                          child: Builder(
                            builder: (context) => IconButton(
                              icon: Icon(Icons.notifications_none),
                              color: Colors.white,
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Maaf, Fitur Belum Tersedia",
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: MediaQuery.of(context).size.height * .05),
                    CarouselPromo(),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Maaf, Fitur Belum Tersedia",
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: MainMenu(
                                height: 140.0,
                                color: Color(0xFFFFEFCF),
                                img: 'assets/images/single_trip.svg',
                                text: RichText(
                                  text: TextSpan(
                                    text: "Let's Find\nYour ",
                                    style: TextStyle(
                                      color: Color(0xFF15121C),
                                      fontSize: 20.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Ticket",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(text: "!")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Builder(
                            builder: (context) => GestureDetector(
                              onTap: () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Maaf, Fitur Belum Tersedia",
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: MainMenu(
                                height: 140.0,
                                color: Color(0xFFE2EBFB),
                                img: 'assets/images/booking_trip.svg',
                                text: RichText(
                                  text: TextSpan(
                                    text: "A ",
                                    style: TextStyle(
                                        color: Color(0xFF15121C),
                                        fontSize: 20.0,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w300),
                                    children: [
                                      TextSpan(
                                        text: "Private",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(text: " Boat?\nWhy Not!")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48.0),
                    RichText(
                      text: TextSpan(
                        text: "Top",
                        style: TextStyle(
                          color: Color(0xFF15121C),
                          fontFamily: 'Lato',
                          fontSize: 18.0,
                        ),
                        children: [
                          TextSpan(
                            text: " Destination",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TopDestination(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
