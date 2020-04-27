import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/lists/top_destination_list.dart';
import 'package:flutter_hanship_ui/screens/top_destination_detail.dart';

class TopDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: topListDestinationLists.length,
        itemBuilder: (BuildContext context, int index) {
          TopListDestinationList topListDestinationList =
              topListDestinationLists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopDestinationDetail(
                    topListDestinationList: topListDestinationList,
                  ),
                ),
              );
            },
            child: Hero(
              tag: topListDestinationList.imgUrl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 8.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 85.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.16),
                              offset: Offset(0.0, 4.0),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0, left: 5.0),
                          child: RichText(
                            text: TextSpan(
                                text: topListDestinationList.namaDestinasi,
                                style: TextStyle(color: Color(0xFF15121C)),
                                children: [
                                  TextSpan(
                                    text: "\n⭐⭐⭐⭐⭐",
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            child: Image.asset(
                              topListDestinationList.imgUrl,
                              fit: BoxFit.cover,
                              height: 170.0,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: Container(
                              height: 70.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
