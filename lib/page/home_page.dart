import 'package:a15_drift/database1/staff_dao.dart';
import 'package:a15_drift/page/add_page.dart';
import 'package:a15_drift/page/update_page.dart';
import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database1/staff_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StaffDao staffDao = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            staffDao.deleteAll();
          }, icon: Icon(Icons.delete),),
          IconButton(
            onPressed: () {
              Get.to(AddStaff());
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
        centerTitle: true,
        title: Text("Student Database"),
      ),
      body: StreamBuilder<List<Staff>>(
        stream: staffDao.getAllStaffs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaffList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error",
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          staffDao.insertStaff(StaffTableCompanion(
            name: df.Value("Staff_Name"),
            address: df.Value("Staff_Address"),
            age: df.Value(23),
            birthday: df.Value(DateTime.now())
          ));
        },
        child: Icon(Icons.person),
      ),
    );
  }

  Widget StaffList(List<Staff> staff){
    return ListView.builder(
      itemCount: staff.length,
      itemBuilder: (context, index){
        return Card(child: Column(
          children: [
            CircleAvatar(child: Text(index.toString()),),
            Text(staff[index].name),
            Text(staff[index].address),
            Text(staff[index].age.toString()),
            Text(staff[index].birthday.toString().split(" ").first),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(onPressed: (){
                  Get.to(UpdateStaff(), arguments: staff[index]);
                }, icon: Icon(Icons.edit), label: Text("Edit"),),
                TextButton.icon(onPressed: (){
                  staffDao.deleteStaff(staff[index]);
                }, icon: Icon(Icons.delete), label: Text("Delete"),),
              ],
            )
          ],
        ));
      }
    );
  }
}
