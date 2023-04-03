// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testdemo/pages/home_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fudge Finnacial Application',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, color: Colors.white),
          headline2: TextStyle(fontSize: 10, color: Colors.white),
          headline3: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
