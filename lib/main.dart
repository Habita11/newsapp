

import 'package:cubit_api/modules/newsApp/dio.dart';
import 'package:cubit_api/modules/newsApp/newsLayout.dart';

import 'package:flutter/material.dart';






void main() {

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch:Colors.deepOrange,),

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const NewsLayout()  ,
    );
  }
}

