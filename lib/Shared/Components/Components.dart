import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget enhancedBackground() {
  return Stack(
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
        alignment: const AlignmentDirectional(0, 1),
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

Widget sunCard(
    {@required context,
    required String asset,
    required String title,
    required String time}) {
  return Row(
    children: [
      Image.asset(asset, width: 60),
      Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Text(time, style: Theme.of(context).textTheme.bodyLarge),
        ],
      )
    ],
  );
}

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset(
        'assets/1.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case >= 300 && < 400:
      return Image.asset(
        'assets/2.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case >= 500 && < 600:
      return Image.asset(
        'assets/3.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case >= 600 && < 700:
      return Image.asset(
        'assets/4.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case >= 700 && < 800:
      return Image.asset(
        'assets/5.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case == 800:
      return Image.asset(
        'assets/6.png',
        fit: BoxFit.fill,
        height: 250,
      );
    case > 800 && <= 804:
      return Image.asset(
        'assets/7.png',
        fit: BoxFit.fill,
        height: 250,
      );
    default:
      return Image.asset(
        'assets/7.png',
        fit: BoxFit.fill,
        height: 250,
      );
  }
}

String convertToReadableDateAndTime(int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var time = dateTime.toLocal().toString();
  dateTime = DateTime.parse(time);
  var formatter = DateFormat("MMMM d, yyyy - hh:mm:ss a");
  return formatter.format(dateTime);
}

var timestamp; // not best practice
String convertToReadableTime(int timestamp) {
  timestamp = timestamp;
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var time = dateTime.toLocal().toString();
  dateTime = DateTime.parse(time);
  var formatter = DateFormat("hh:mm a");
  return formatter.format(dateTime);
}

String getGreeting() {
  timestamp = convertToReadableTime(timestamp);
  var dateTime = DateTime.parse(timestamp);
  var hour = dateTime.hour;
  if (hour >= 6 && hour < 12) {
    return "Good Morning";
  } else if (hour >= 12 && hour < 18) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}
