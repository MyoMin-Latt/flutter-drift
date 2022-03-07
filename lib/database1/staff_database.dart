import 'dart:io';
import 'package:a15_drift/database1/staff_dao.dart';
import 'package:path/path.dart';
import 'package:a15_drift/database1/staff_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'staff_database.g.dart';

@DriftDatabase(tables: [StaffTable], daos: [StaffDao])
class StaffDatabase extends _$StaffDatabase{
  StaffDatabase() : super(_database());
  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

LazyDatabase _database(){
  return LazyDatabase(()async {
    final folder = await getApplicationDocumentsDirectory();
    final dbFile = File(join(folder.path, "staff.dat"));
    return NativeDatabase(dbFile);
  });
}