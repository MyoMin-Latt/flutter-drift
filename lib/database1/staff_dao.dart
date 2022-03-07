import 'package:a15_drift/database1/staff_database.dart';
import 'package:a15_drift/database1/staff_table.dart';
import 'package:drift/drift.dart';
part 'staff_dao.g.dart';
@DriftAccessor(tables: [StaffTable])
class StaffDao extends DatabaseAccessor<StaffDatabase> with _$StaffDaoMixin{
  StaffDao(StaffDatabase staffDatabase) : super(staffDatabase);
  
  Future<int> insertStaff(StaffTableCompanion staff)async{
    return await into(staffTable).insert(staff);
  }

  Stream<List<Staff>> getAllStaffs(){
    return select(staffTable).watch();
  }

  Future<bool> updateStaff(StaffTableCompanion staff)async{
    return await update(staffTable).replace(staff);
  }

  Future<int> deleteStaff(Staff staff)async{
    return await delete(staffTable).delete(staff);
  }

  Future<int> deleteAll()async{
    return await (delete(staffTable)..where((tbl) => tbl.id.isBiggerThanValue(0))).go();
  }
}