

import 'package:a15_drift/database1/staff_database.dart';
import 'package:a15_drift/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  StaffDatabase staffDatabase = StaffDatabase();
  Get.put(staffDatabase.staffDao);
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
















// @15.6 Drift Database ORM [Part 6]
// @15.7 Drift list all data from database[Part 7]
// @15.8 Drift Database Student Form[Part 8]
// @15.9 Saving Data [Part 9]
// @15.10 Database Singleton Object and Dependency Injection[Part 10]
// @15.11 Student List item [Part 11]
// @15.12 Drift ORM delete single item[Part 12]
// @15.13 Drift ORM update student[Part 13]
// @15.14 Drift ORM delete all students [Part 14]
// @15.15 Drift ORM Dao [Part 15]/ Modular structure ဖြစ်အောင် Dao ကိုသပ်သပ်ခွဲရေးသွားမှာဖြစ်ပါတယ်။
// @15.16 Drift ORM ordering student[Part 16]
// @15.17 Drift ORM filtering(where clause)[Part 17]


// import 'package:a15_drift/database/student_database.dart';
// import 'package:a15_drift/ui/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   StudentDatabase studentDatabase = StudentDatabase();
//   Get.put(studentDatabase.studentDao);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

