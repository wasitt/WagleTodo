import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';

class InformationSettingsScreen extends StatelessWidget {
  const InformationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppBar(text: "정보"),
        body: Center(child: Text("아직 준비중입니다", style: TextStyle(fontSize: 30))));
  }
}
