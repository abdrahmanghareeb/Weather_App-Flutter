import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/Cubit/weather_cubit.dart';
import 'package:weather_app/Shared/Network/Remote/dioHelper.dart';

import 'Layouts/HomeLayout.dart';
import 'Shared/Cubit/weather_observer.dart';

void main() {
  //to mage sure every thing is initialized before run App
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  // dioHelper.getResponse(method: "data/2.5/weather", query: {
  //   "main" : "temp",
  //   "main" : "temp_min",
  //   "main" : "temp_max",
  //   "main" : "humidity",
  //   "sys" : "country",
  //   "sys" : "sunrise",
  //   "sys" : "sunset",
  //   "name" : "",
  //   "cod" : ""
  // }).then((value) {
  //   print(value.data.toString());
  //   // emit(getResponseSucessState());
  // }).onError((error, stackTrace) {
  //   // emit(getResponseErrorState(error));
  //   print(error.toString());
  // });

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
              bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: AutofillHints.addressCityAndState),
              displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.birthday))),
      home: BlocProvider(
        create: (context) => WeatherCubit()..changeDeterminePositionState(),
        child: HomeLayout(),
      ),
    );
  }
}
