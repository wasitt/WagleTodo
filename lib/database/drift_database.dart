import 'package:wagle_todo/model/todo.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Todos,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openDb());

  @override
  int get schemaVersion => 1;

  ///특정날짜의 일정 불러오기(watch)
  /// select 는 watch , get이 있어야 실행 가능
  Stream<List<Todo>> watchTodos(DateTime date) =>
      (select(todos)..where((tbl) => tbl.date.equals(date))).watch();

  ///새로운 일정 등록(insert)
  ///
  Future<int> createTodo(TodosCompanion data) => into(todos).insert(data);

  ///일정 삭제(delete)
  /// delete 는 go가 있어야 실행 가능
  Future<int> removeTodo(int id) =>
      (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
}

LazyDatabase _openDb() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase(file);
  });
}
