import 'package:a15_drift/database/student_dao.dart';
import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/ui/add_screen.dart';
import 'package:a15_drift/ui/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  StudentDao studentDao = Get.find();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AddScreen());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(onPressed: (){
            showDialog(context: context, 
            builder: (context){
              return AlertDialog(
                title: Text('Sure to Delete all'),
                actions: [
                  IconButton(onPressed: (){
                    studentDao.deleteAllStudents();
                    Navigator.pop(context);
                  }, icon: Text("Yes"),),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Text("No"),),
                ],
              );
            });
          }, icon: Icon(Icons.delete))
        ],
        centerTitle: true,
        title: Text('Student Database'),
      ),
      body: StreamBuilder<List<Student>>(
          stream: studentDao.getAllStudents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return studentList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget studentList(List<Student> student) {
    return ListView.builder(
        itemCount: student.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateScreen(student: student[index]);
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        studentDao.deleteStudent(student[index]);
                      },
                      icon: Icon(Icons.delete)),
                ]),
                Text(student[index].name),
                Text(student[index].address),
                Text(student[index].phone),
                Text(student[index].age.toString()),
                Text(student[index].birthday.toString()),
              ],
            ),
          );
        });
  }
}
