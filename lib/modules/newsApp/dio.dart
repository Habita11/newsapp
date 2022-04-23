// https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=API_KEY


import'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;


  static init()
  {
    dio=Dio(
        BaseOptions(
            baseUrl:'https://newsapi.org/',
            receiveDataWhenStatusError:true
        )

    );
  }
  static Future<Response> getData ({
  required String url,
  required Map<String,dynamic> query  
})
  async
  {
    return await dio!.get(url,queryParameters: query) ;
  }
}