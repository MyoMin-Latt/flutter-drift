import 'package:drift/drift.dart';
@DataClassName("Staff")
class StaffTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named("name")();
  TextColumn get address => text().named("address")();
  IntColumn get age => integer()();
  DateTimeColumn get birthday => dateTime()();
}