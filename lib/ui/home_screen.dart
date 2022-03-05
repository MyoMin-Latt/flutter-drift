import 'package:a15_drift/database/student_dao.dart';
import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/ui/add_screen.dart';
import 'package:a15_drift/ui/update_screen.dart';
import 'package:drift/drift.dart' as db;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StudentDao studentDao = Get.find();
  late Stream<List<Student>> _studentStream;
  @override
  void initState() {
    super.initState();
    _studentStream = studentDao.getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: Icon(Icons.list),
            onSelected: (str) {
              if (str == "default") {
                setState(() {
                  _studentStream = studentDao.getAllStudents();
                });
              } else if (str == "accend") {
                setState(() {
                  _studentStream =
                      studentDao.getAllStudents(mode: db.OrderingMode.asc);
                });
              } else if (str == "decend") {
                setState(() {
                  _studentStream =
                      studentDao.getAllStudents(mode: db.OrderingMode.desc);
                });
              } else if (str == "over25") {
                setState(() {
                  _studentStream = studentDao.getAllStudents(over25: true);
                });
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("Default"),
                  value: "default",
                ),
                const PopupMenuItem(
                  child: Text("Age by Accending"),
                  value: "accend",
                ),
                const PopupMenuItem(
                  child: Text("Age by Decending"),
                  value: "decend",
                ),
                const PopupMenuItem(
                  child: Text("Age Over 25"),
                  value: "over25",
                ),
              ];
            }),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AddScreen());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Sure to Delete all'),
                        actions: [
                          IconButton(
                            onPressed: () {
                              studentDao.deleteAllStudents();
                              Navigator.pop(context);
                            },
                            icon: Text("Yes"),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Text("No"),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete))
        ],
        centerTitle: true,
        title: Text('Student Database'),
      ),
      body: StreamBuilder<List<Student>>(
          stream: _studentStream,
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
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      studentDao.deleteStudent(student[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(child: Text(student[index].id.toString()))
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
