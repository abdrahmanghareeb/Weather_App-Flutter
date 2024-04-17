import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Layouts/HomeLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,
          textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400 , fontFamily: AutofillHints.addressCityAndState),
              displaySmall: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold ,fontFamily: AutofillHints.birthday))
      ),
      home: HomeLayout(),
    );
  }
}
