

import 'package:a15_drift/database/student_database.dart';
import 'package:a15_drift/database/student_table.dart';
import 'package:drift/drift.dart';
part 'student_dao.g.dart';
@DriftAccessor(tables: [StudentTable])
class StudentDao extends DatabaseAccessor<StudentDatabase> with _$StudentDaoMixin{
  StudentDao(StudentDatabase studentDatabase) : super(studentDatabase);
  Future<int> insertStudent(StudentTableCompanion student)async{
    return into(studentTable).insert(student);
  }

  Stream<List<Student>> getAllStudents(){
    return select(studentTable).watch();
  }

  Future<bool> updateStudent(StudentTableCompanion student)async{
    return await update(studentTable).replace(student);
  }

  Future<int> deleteStudent(Student student)async{
    return await delete(studentTable).delete(student);
  }

  Future deleteAllStudents()async{
    return await (delete(studentTable)..where((tbl) => tbl.id.isBiggerThanValue(0))).go();
  }
}