import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()(); //내용
  DateTimeColumn get date => dateTime()(); //일정의 날짜
  IntColumn get startTime => integer().withDefault(const Constant(0))();
  IntColumn get endTime => integer().withDefault(const Constant(0))();
  BoolColumn get isCompleted =>
      boolean().withDefault(const Constant(false))(); // 완료 여부
}
