// @15.6 Drift Database ORM [Part 6]
// @15.7 Drift list all data from database[Part 7]
// @15.8 Drift Database Student Form[Part 8]

import 'package:a15_drift/ui/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}