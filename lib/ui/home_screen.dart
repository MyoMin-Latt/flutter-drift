import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/ui/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  StudentDatabse studentDatabse = Get.find();
  HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) {
              return AddStudent();
            },));
          }, icon: Icon(Icons.add))
        ],
        centerTitle: true,
        title: Text("Student Db"),
      ),
      body: StreamBuilder<List<Student>>(
        stream: studentDatabse.getAllStudent(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return _studentList(snapshot.data!);
          }
          else if (snapshot.hasError){
            return Text("Error");
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        }),
    );
  }
  Widget _studentList(List<Student> students){
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Divider(color: Color.fromARGB(255, 150, 158, 165),),
              Text(students[index].name),
              Divider(color: Color.fromARGB(255, 150, 158, 165),),
              Text(students[index].address),
              Divider(color: Color.fromARGB(255, 150, 158, 165),),
              Text(students[index].phone),
              Divider(color: Color.fromARGB(255, 150, 158, 165),),
              Text(students[index].age.toString()),
              Divider(color: Color.fromARGB(255, 150, 158, 165),),
              Text(students[index].birthday.toString()),
              // Divider(color: Color.fromARGB(255, 1, 20, 36),),
            ],
          ),
        );
      });
  }
}