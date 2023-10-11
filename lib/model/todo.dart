import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()(); //내용
  DateTimeColumn get date => dateTime()(); //일정의 날짜
  IntColumn get startTime => integer()(); // 시작 시간
  IntColumn get endTime => integer()(); //종료 시간
  BoolColumn get isCompleted =>
      boolean().withDefault(const Constant(false))(); // 완료 여부
}
