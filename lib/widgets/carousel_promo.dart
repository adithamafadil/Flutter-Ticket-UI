import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/img1.jpg',
  'assets/images/img2.jpg',
  'assets/images/img3.jpg',
  'assets/images/img4.jpg',
  'assets/images/img5.jpg',
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(children: <Widget>[
          Image.asset(
            i,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

class CarouselPromo extends StatefulWidget {
  @override
  _CarouselPromoState createState() => _CarouselPromoState();
}

class _CarouselPromoState extends State<CarouselPromo> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Promo Slider " + '${_current + 1}',
                ),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: CarouselSlider(
            items: child,
            autoPlay: true,
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height * .17,
            pauseAutoPlayOnTouch: Duration(),
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                imgList,
                (index, url) {
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Colors.white
                          : Colors.white.withAlpha(90),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
