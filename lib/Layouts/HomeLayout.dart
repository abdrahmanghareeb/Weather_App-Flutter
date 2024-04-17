import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Shared/Components/Components.dart';

class HomeLayout extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "📍 Cairo, Egypt",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Good Morning",
                      style: Theme.of(context).textTheme.displaySmall),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Image.asset(
                    "assets/3.png",
                    fit: BoxFit.fill,
                    height: 250,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '18°C',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Raining",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Text("April 17, 2024 - 6:00 AM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sunCard(context: context ,title: "sunrise" ,time: "5:30 am" ,asset: "assets/11.png"),
                          const SizedBox(height: 30),
                          sunCard(context: context ,title: "max" ,time: "18°C" ,asset: "assets/13.png"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sunCard(context: context ,title: "sunset" ,time: "5:30 pm" ,asset: "assets/12.png"),
                          const SizedBox(height: 30),
                          sunCard(context: context ,title: "min" ,time: "14°C" ,asset: "assets/14.png"),
                        ],
                      ),
                       ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
