import 'dart:io';

import 'package:a15_drift/database/student_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
part 'student_database.g.dart';
@DriftDatabase(tables: [StudentTable])
class StudentDatabse extends _$StudentDatabse{
  StudentDatabse() : super(_database());

  Future<int> insertStudent(Student student) async{
    return await into(studentTable).insert(student);
  }

  Stream<List<Student>> getAllStudent(){
    return select(studentTable).watch();
  }

  Future<bool> updateStudent(Student student)async{
    return await update(studentTable).replace(student);
  }

  Future<int> deleteStudent(Student student)async{
    return await delete(studentTable).delete(student);
  }

  Future<int> deleteAllStudents(List<Student> studens)async{
    return await deleteAllStudents(studens);
  }
  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
  
}

LazyDatabase _database(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory(); // folder, directory
    final dbFile = File(join(dbFolder.path, "student.dat")); // file(directory.path, "db")
    return NativeDatabase(dbFile);
  });
}