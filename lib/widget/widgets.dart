import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

Widget profileWidget(BuildContext context){

  return  FadeIn(
    duration: Duration(seconds: 2),
    curve: Curves.easeIn,
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.40))
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.23, left: MediaQuery.of(context).size.width * 0.20),
          child: Container(
            height: 70,
            width: 70,
            child: Icon(Icons.person, size: 60, color: Colors.orange,),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
          ),
        )
      ],
    ),
  );
}