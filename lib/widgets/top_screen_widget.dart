import 'package:flutter/material.dart';
import 'package:flutter_hanship_ui/widgets/custom_shape_clipper.dart';

class TopScreenWidget extends StatelessWidget {
  final double height;

  TopScreenWidget({@required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * height,
            child: ClipRect(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/tropical.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * height,
            color: Colors.black.withOpacity(.5),
          ),
        ],
      ),
    );
  }
}
