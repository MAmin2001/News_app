

import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type':'application/json'}
        // receiveTimeout: ,
        // connectTimeout: ,
      )
    );
  }


  static Future <Response> getData({

     required String url,
     required  Map<String,dynamic> query
})async
  {
    return await dio.get(url,queryParameters: query);
  }






}