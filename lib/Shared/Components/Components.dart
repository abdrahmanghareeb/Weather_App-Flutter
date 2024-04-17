import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget enhancedBackground(){
  return  Stack(
    children: [
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0,1),
        child: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 300.0, sigmaY: 300.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    ],
  );
}