import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/ui/add_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  StudentDatabse studentDatabse = StudentDatabse();
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
            return Text(snapshot.data.toString());
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
}