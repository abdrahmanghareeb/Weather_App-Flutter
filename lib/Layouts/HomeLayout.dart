import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Cubit/weather_cubit.dart';

import '../Shared/Components/Components.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = WeatherCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            enhancedBackground(),
            ConditionalBuilder(
              condition: cubit.response == null,
              builder: (context) => const Center(child: CircularProgressIndicator()),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          if(value.isNotEmpty) {
                            cubit.get_API_ResponseBySearch(cityName: value);
                          }
                        },
                        decoration: InputDecoration( label: Text(
                          "📍 ${cubit.response["name"]}, ${cubit.response["sys"]["country"]}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Hello Buddy...",
                          style: Theme.of(context).textTheme.displaySmall, overflow: TextOverflow.ellipsis, maxLines: 1,),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: getWeatherIcon(cubit.response["weather"][0]["id"])),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          '${cubit.response["main"]["temp"].round()}°C',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Center(
                        child: Text(
                          cubit.response["weather"][0]["main"].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child:
                        Text(convertToReadableDateAndTime(cubit.response["dt"]),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sunCard(context: context ,title: "sunrise" ,time: convertToReadableTime(cubit.response["sys"]["sunrise"]) ,asset: "assets/11.png"),
                                const SizedBox(height: 30),
                                sunCard(context: context ,title: "max" ,time: '${cubit.response["main"]["temp_max"].round()}°C' ,asset: "assets/13.png"),
                              const SizedBox(height: 30),
                                sunCard(context: context ,title: "humidity" ,time: '${cubit.response["main"]["humidity"].round()}%'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sunCard(context: context ,title: "sunset" ,time: convertToReadableTime(cubit.response["sys"]["sunset"]) ,asset: "assets/12.png"),
                                const SizedBox(height: 30),
                                sunCard(context: context ,title: "min" ,time: '${cubit.response["main"]["temp_min"].round()}°C',asset: "assets/14.png"),
                              const SizedBox(height: 30),
                                sunCard(context: context ,title: "speed" ,time: '${cubit.response["wind"]["speed"].round()}km/h'),
                              ],
                            ),
                          ),
                           ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
