import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:wagle_todo/database/drift_database.dart';
import 'package:wagle_todo/component/icon_buttons.dart';

class HomeSpeedDial extends StatelessWidget {
  final DateTime selectedDate;
  const HomeSpeedDial({required this.selectedDate, super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: BLACK_COLOR.withOpacity(0.2),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add, color: WHITE_COLOR),
          label: "일정등록",
          backgroundColor: BLACK_COLOR.withOpacity(0.2),
          labelBackgroundColor: BLACK_COLOR.withOpacity(0.2),
          labelStyle: const TextStyle(color: WHITE_COLOR),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RegisterTodo(selectedDate: selectedDate);
              },
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.category_outlined, color: WHITE_COLOR),
          label: "카테고리 관리",
          backgroundColor: BLACK_COLOR.withOpacity(0.2),
          labelBackgroundColor: BLACK_COLOR.withOpacity(0.2),
          labelStyle: const TextStyle(color: WHITE_COLOR),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView(
                  children: [
                    Category(text: "서강대학교", photo: "서강대아이콘"),
                    Category(text: "할 수 있다!", photo: "할수있다강아지"),
                    Category(text: "와글버튼1", photo: "W1"),
                    Category(text: "와글버튼2", photo: "W2"),
                    Category(text: "꿀벌1", photo: "wagle_design/character/꿀벌1"),
                    Category(text: "꿀벌2", photo: "wagle_design/character/꿀벌2"),
                    Category(text: "꿀벌3", photo: "wagle_design/character/꿀벌3"),
                    Category(text: "꿀벌4", photo: "wagle_design/character/꿀벌4"),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}

///카테고리 양식
///
///
class Category extends StatelessWidget {
  final String text;
  final String photo;
  const Category({
    required this.text,
    required this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd, // 오른쪽에서 왼쪽으로 스와이프
      onDismissed: (direction) {},
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('정말 삭제하시겠습니까?'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('네'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('아니오'),
                  ),
                ],
              ),
            );
          },
        );
      },
      background: Container(
        color: RED_COLOR,
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.delete_forever_outlined,
            color: WHITE_COLOR,
            size: 50,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Image.asset("asset/img/$photo.png"),
          title: Row(
            children: [
              Text(text),
            ],
          ),
          trailing: const OnOffIconButton(),
        ),
      ),
    );
  }
}

///todo 등록 다이얼로그
///
class RegisterTodo extends StatefulWidget {
  final DateTime selectedDate;
  const RegisterTodo({
    required this.selectedDate,
    super.key,
  });

  @override
  State<RegisterTodo> createState() => _RegisterTodoState();
}

class _RegisterTodoState extends State<RegisterTodo> {
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text("Todo 등록"),
        actions: <Widget>[
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text("할일 입력"),
              ),
              InputTextField(contentController: _contentController),

              ///231012-2
              ///Todo 등록에 시간 빼기
              ///데이터베이스 부분 초기화
              ///
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
          TextButton(
            onPressed: () async {
              await GetIt.I<LocalDatabase>().createTodo(
                TodosCompanion(
                  content: Value(_contentController.text),
                  date: Value(widget.selectedDate),
                  startTime: Value(0),
                  endTime: Value(0),
                  isCompleted: Value(false),
                ),
              );
              Navigator.of(context).pop();
            },
            child: const Text("저장"),
          ),
        ],
      ),
    );
  }
}

///Todo 다이얼로그의 텍스트 입력칸
///
class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required TextEditingController? contentController,
  }) : _contentController = contentController;

  final TextEditingController? _contentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: BLACK_COLOR.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Todo 입력!"),
          controller: _contentController,
        ),
      ),
    );
  }
}
