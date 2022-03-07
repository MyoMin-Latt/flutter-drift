import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database1/staff_dao.dart';
import '../database1/staff_database.dart';

class UpdateStaff extends StatefulWidget {
  const UpdateStaff({Key? key}) : super(key: key);
  @override
  State<UpdateStaff> createState() => _UpdateStaffState();
}
class _UpdateStaffState extends State<UpdateStaff> {
  final _formKey = GlobalKey<FormState>();
  StaffDao staffDao = Get.find();
  String? name, address, age;
  DateTime? birthday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Staff"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your name";
                  }
                },
                onSaved: (val) {
                  name = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter your name",
                    labelText: "Name"),
              ),
            ),
            // address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your address";
                  }
                },
                onSaved: (val) {
                  address = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter your address",
                    labelText: "Address"),
              ),
            ),
            //age
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your age";
                  }
                },
                onSaved: (val) {
                  age = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter your age",
                    labelText: "Age"),
              ),
            ),
            //birthday
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  birthday = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1996),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2022),
                  );
                  print(birthday);
                  setState(() {});
                },
                child: Text(
                  birthday != null ? birthday.toString() : "Select your birthday",
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  if(birthday == null){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Select your birthday"))
                    );
                  }
                  else if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    staffDao.insertStaff(
                    StaffTableCompanion(
                        name: df.Value(name!),
                        address: df.Value(address!),
                        age: df.Value(int.parse(age!)),
                        birthday: df.Value(birthday!),),
                  );
                  Navigator.pop(context);
                  }
                  
                },
                icon: Icon(Icons.save),
                label: Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
