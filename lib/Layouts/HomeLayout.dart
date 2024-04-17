import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Shared/Components/Components.dart';

class HomeLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              enhancedBackground(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Text("Cairo, Egypt"),
                    // Text("Good Morning"),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

}