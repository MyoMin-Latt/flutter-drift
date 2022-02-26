import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  String? name, address, phone, age;
  DateTime? birthday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student(sqflite'),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your name';
                      }
                    },
                    onSaved: (val) {
                      name = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your address';
                      }
                    },
                    onSaved: (val) {
                      address = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter your address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your phone';
                      }
                    },
                    onSaved: (val) {
                      phone = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "Enter your phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Age';
                      }
                    },
                    onSaved: (val) {
                      age = val;
                    },
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "Enter your age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                TextButton.icon(
                    onPressed: () async {
                      
                      birthday = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1991),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now());
                          setState(() {
                            print('$birthday');
                          });
                    },
                    icon: Icon(Icons.date_range),
                    label: Text("Select Birthday")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$birthday'),
                ),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState == null ||
                          _formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text('Save')),
              ],
            ),
          )),
    );
  }
}
