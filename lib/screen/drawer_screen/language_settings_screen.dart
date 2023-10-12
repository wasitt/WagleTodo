import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wagle_todo/component/app_bar.dart';
import 'package:wagle_todo/const/colors.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(text: "언어"),
      body: Column(
        children: [
          LanguageListView(),
          LanguageSubmitButton(),
        ],
      ),
    );
  }
}

class LanguageListView extends StatelessWidget {
  const LanguageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      child: ListView.builder(
        itemCount: 17,
        itemBuilder: (context, index) {
          return LanguageTile();
        },
      ),
    );
  }
}

class LanguageSubmitButton extends StatelessWidget {
  const LanguageSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("저장하기"),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(GREY_COLOR),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)))),
        ),
      ),
    );
  }
}

class LanguageTile extends StatefulWidget {
  const LanguageTile({super.key});

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("한국어 (KOREAN)"),
          trailing: selected ? Icon(Icons.check, color: BLUE_COLOR) : null,
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
