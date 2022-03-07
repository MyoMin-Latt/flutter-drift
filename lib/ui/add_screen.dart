// import 'package:a15_drift/database/student_dao.dart';
// import 'package:a15_drift/database/student_database.dart';
// import 'package:drift/drift.dart' as drift;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddScreen extends StatefulWidget {
//   AddScreen({Key? key}) : super(key: key);

//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }

// class _AddScreenState extends State<AddScreen> {
//   final _formKey = GlobalKey<FormState>();
//   StudentDao studentDao = Get.find();
//   String? name, address, phone, age;

//   DateTime? birthday;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Student'),
//       ),
//       body: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter your name';
//                     }
//                   },
//                   onSaved: (val) {
//                     name = val;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Name",
//                       hintText: "Enter your name",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter your address';
//                     }
//                   },
//                   onSaved: (val) {
//                     address = val;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Address",
//                       hintText: "Enter your address",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter your phone';
//                     }
//                   },
//                   onSaved: (val) {
//                     phone = val;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Phone",
//                       hintText: "Enter your phone",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter your email';
//                     }
//                   },
//                   onSaved: (val) {
//                     age = val;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Age",
//                       hintText: "Enter your age",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                 ),
//               ),
//               TextButton.icon(
//                   onPressed: () async {
//                     birthday = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime(1996),
//                         firstDate: DateTime(1990),
//                         lastDate: DateTime.now());
//                     print('$birthday');
//                     setState(() {});
//                   },
//                   icon: Icon(Icons.date_range),
//                   label: Text("Select your birthday")),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   child: Text('$birthday'),
//                   onPressed: () {},
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton.icon(
//                     onPressed: () {
//                       if (birthday == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Please select your birthday")));
//                       } else if (_formKey.currentState == null ||
//                           _formKey.currentState!.validate()) {
//                         _formKey.currentState?.save();
//                         studentDao.insertStudent(StudentTableCompanion(
//                           name: drift.Value(name!),
//                           address: drift.Value(address!),
//                           phone: drift.Value(phone!),
//                           age: drift.Value(int.parse(age!)),
//                           birthday: drift.Value(birthday!),
//                         ));

//                         Navigator.pop(context, 'success');
//                       }
//                     },
//                     icon: Icon(Icons.save),
//                     label: Text('Save')),
//               ),
//             ],
//           )),
//     );
//   }
// }
