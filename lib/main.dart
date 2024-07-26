import 'package:flutter/material.dart';
import 'package:weather_app/views/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Homepage(),
    },
  ));
}
