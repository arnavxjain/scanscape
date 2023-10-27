import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scanscape/screens/home.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    // statusBarColor: Colors.blueAccent, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  ));

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}