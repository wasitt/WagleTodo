import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NotificationScreenAppBar(), body: ToggleButtonMade());
  }
}

class ToggleButtonMade extends StatefulWidget {
  @override
  _ToggleButtonsExampleState createState() => _ToggleButtonsExampleState();
}

class _ToggleButtonsExampleState extends State<ToggleButtonMade> {
  List<bool> isSelected = [true, false, false]; // 초기 선택 상태 설정

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(10.0),
              children: [
                Text("일정"),
                Text("D-day"),
                Text("업데이트"),
              ],
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
