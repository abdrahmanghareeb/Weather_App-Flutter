import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

Widget sunCard({@required context ,required String asset ,required String title ,required String time }){
  return Row(
    children: [
      Image.asset(asset,width: 60),
      Column(
        children: [
          Text(title, style : Theme.of(context).textTheme.bodyLarge),
          Text(time, style : Theme.of(context).textTheme.bodyLarge),
        ],
      )
    ],
  );
}

String convertToCelcius({@required temp}){
  return "${(temp - 273).round()}°C";
}

String convertToReadableDateAndTime (int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var time =  dateTime.toLocal().toString();
   dateTime = DateTime.parse(time);
  var formatter = DateFormat("MMMM d, yyyy - hh:mm:ss a");
  return formatter.format(dateTime);
}

String convertToReadableTime (int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var time =  dateTime.toLocal().toString();
  dateTime = DateTime.parse(time);
  var formatter = DateFormat("hh:mm a");
  return formatter.format(dateTime);
}

String getGreeting(String timestamp) {
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