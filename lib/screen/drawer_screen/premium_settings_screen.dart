import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';

class PremiumSettingsScreen extends StatelessWidget {
  const PremiumSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppBar(text: "프리미엄"),
        body: Center(child: Text("아직 준비중입니다", style: TextStyle(fontSize: 30))));
  }
}
