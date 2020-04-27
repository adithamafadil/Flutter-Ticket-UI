import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenu extends StatelessWidget {
  final Widget text;
  final Color color;
  final String img;
  final double height;

  MainMenu({this.text, this.img, @required this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.16),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: SvgPicture.asset(
              img,
              height: 130.0,
            ),
          ),
          Positioned(
            bottom: 12.0,
            left: 12.0,
            child: text,
          ),
        ],
      ),
    );
  }
}
