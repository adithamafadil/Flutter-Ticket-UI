import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/lists/top_destination_list.dart';
import 'package:flutter_hanship_ui/widgets/suggestion_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopDestinationDetail extends StatefulWidget {
  final TopListDestinationList topListDestinationList;

  TopDestinationDetail({this.topListDestinationList});

  @override
  _TopDestinationDetailState createState() => _TopDestinationDetailState();
}

class _TopDestinationDetailState extends State<TopDestinationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.topListDestinationList.imgUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    child: Image.asset(
                      widget.topListDestinationList.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.sort),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.topListDestinationList.namaDestinasi,
                      style: TextStyle(
                        fontSize: 37.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white70,
                          size: 15.0,
                        ),
                        SizedBox(width: 9.0),
                        Text(
                          widget.topListDestinationList.kotaDestinasi,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          SizedBox(height: 24.0),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 12.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    height: 170.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: RichText(
                            text: TextSpan(
                              text: "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF15121C),
                                fontFamily: 'Lato',
                                fontSize: 18.0,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n\n" +
                                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. " +
                                      "Aut illum sequi atque quia amet sunt dolor" +
                                      "exercitationem consequatur necessitatibus ipsam.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: RichText(
                      text: TextSpan(
                        text: "Recommended",
                        style: TextStyle(
                          color: Color(0xFF15121C),
                          fontFamily: 'Lato',
                          fontSize: 18.0,
                        ),
                        children: [
                          TextSpan(
                            text: " Place",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Suggestion(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
