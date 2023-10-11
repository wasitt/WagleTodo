import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wagle_todo/component/icon_buttons.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:wagle_todo/database/drift_database.dart';

///투두 리스트
///
///
class TodoReorderableListView extends StatefulWidget {
  final DateTime selectedDate;
  const TodoReorderableListView({required this.selectedDate, super.key});

  @override
  State<TodoReorderableListView> createState() =>
      _TodoReorderableListViewState();
}

class _TodoReorderableListViewState extends State<TodoReorderableListView> {
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: GetIt.I<LocalDatabase>().watchTodos(widget.selectedDate),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: BLACK_COLOR.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("오늘 할 일 : ${snapshot.data!.length}개",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ],
              ),
              ReorderableListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                onReorder: (oldIndex, newIndex) {
                  if (snapshot.data!.length <= 1) {
                    return;
                  }
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final movedItem = snapshot.data![oldIndex];

                  setState(() {
                    snapshot.data!.removeAt(oldIndex);
                    snapshot.data!.insert(newIndex, movedItem);
                  });
                },
                itemBuilder: (context, index) {
                  final todo = snapshot.data![index];
                  return Dismissible(
                    key: ObjectKey(todo.id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (DismissDirection direction) {
                      GetIt.I<LocalDatabase>().removeTodo(todo.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: TodoListTile(
                        startTime: todo.startTime,
                        endTime: todo.endTime,
                        content: todo.content,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

///투두 리스트의 투두타일
///
class TodoListTile extends StatefulWidget {
  final int startTime;
  final int endTime;
  final String content;

  const TodoListTile(
      {required this.startTime,
      required this.endTime,
      required this.content,
      Key? key})
      : super(key: key);

  @override
  State<TodoListTile> createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const OnOffIconButton(
                onIcon: Icons.check_box_outlined,
                offIcon: Icons.check_box_outline_blank,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.content,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.more_horiz_outlined),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("수정하기"),
                            Text("다른 날로 미루기"),
                            Text("소주제 만들기"),
                            Text("시간 설정하기")
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),

          ///시간 박스
          ///
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "${widget.startTime}:00 ~ ${widget.endTime}:00",
              style: const TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
    );
  }
}
