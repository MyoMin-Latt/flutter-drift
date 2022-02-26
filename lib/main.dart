// @15.6 Drift Database ORM [Part 6]
// @15.7 Drift list all data from database[Part 7]
// @15.8 Drift Database Student Form[Part 8]
// @15.9 Saving Data [Part 9]
// @15.10 Database Singleton Object and Dependency Injection[Part 10]
// @15.11 Student List item [Part 11]
import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  StudentDatabse studentDatabse = StudentDatabse();
  Get.put(studentDatabse);
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