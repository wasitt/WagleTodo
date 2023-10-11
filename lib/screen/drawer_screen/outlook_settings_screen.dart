import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';

class OutlookSettingsScreen extends StatelessWidget {
  const OutlookSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppBar(text: "외관"),
        body: Center(child: Text("아직 준비중입니다", style: TextStyle(fontSize: 30))));
  }
}
