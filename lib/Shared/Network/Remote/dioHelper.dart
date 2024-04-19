import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// https://api.openweathermap.org/data/2.5/weather?lat=30.5764764&lon=31.2587603&appid=6ab2242ff2990d8d801e4fdaf6a48de2
class dioHelper{
  static Dio dio = Dio(BaseOptions(baseUrl: "https://api.openweathermap.org/"));
  
  static Future<Response> getResponse({@required method , required Map<String, dynamic>? query}) async {
    return await dio.get(method, queryParameters: query );
  }
}