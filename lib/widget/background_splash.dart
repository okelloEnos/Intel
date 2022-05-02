import 'package:flutter/material.dart';
import 'package:intel_test/util/swatch_colors.dart';

class Background extends StatelessWidget {
  final double width;


  const Background({this.width, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _width = width;

    final theme = Theme.of(context);
    final color = SwatchColors().lightPrimarySwatch;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
          ),
          child: Stack(
            children: <Widget>[

              Positioned(       // right bottom circle
                  width: _width*0.8,
                  height: _width*0.8,
                  bottom: -_width*0.4,
                  right: -_width*0.4,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x10FFFFFF),
                    ),
                  )),

              Positioned(       // left bottom circle
                  width: _width*0.3,
                  height: _width*0.3,
                  bottom: _width*0.5,
                  left: -_width*0.1,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x10FFFFFF),
                    ),
                  )),

              Positioned(       // left bottom circle
                  width: _width*0.2,
                  height: _width*0.2,
                  bottom: _width*0.2,
                  left: _width*0.1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0x10FFFFFF),
                      shape: BoxShape.circle,
                    ),
                  )),
          Positioned(
            top: 70,
            left: 10,
            child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset("assets/images/star.png",
                    fit: BoxFit.contain, color: color.shade500,
                )
            )),

              Positioned(
                  bottom: 20,
                  left: _width*0.2,
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/star.png",
                        fit: BoxFit.contain, color: color.shade600,
                      )
                  )),

              Positioned(
                  bottom: 10,
                  left: _width*0.7,
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/star.png",
                        fit: BoxFit.contain, color: color.shade500,
                      )
                  )),

              Positioned(
                  top: 20,
                  left: _width*0.5,
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/star.png",
                        fit: BoxFit.contain, color: color.shade500,
                      )
                  )),

            ],
          )
      ),
    );
  }
}
