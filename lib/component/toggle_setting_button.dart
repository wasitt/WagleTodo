import 'package:flutter/material.dart';
import 'package:wagle_todo/component/icon_buttons.dart';

class ToggleSettingButton extends StatelessWidget {
  const ToggleSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MondayStartToggle(),
                  MonthFormatToggle(),
                  TimeFormat24Toggle(),
                  DarkModeToggle(),
                  PostponeTodoToggle(),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.tune, size: 30),
    );
  }
}

///달력월요일부터 시작 토글
///
class MondayStartToggle extends StatelessWidget {
  const MondayStartToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("달력 월요일부터 시작"),
        OnOffIconButton(),
      ],
    );
  }
}

///월/주로 보기 토글
///
class MonthFormatToggle extends StatelessWidget {
  const MonthFormatToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("달력 월/주로 보기"),
        OnOffIconButton(),
      ],
    );
  }
}

///24시간제 토글
///
class TimeFormat24Toggle extends StatelessWidget {
  const TimeFormat24Toggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("24시간제로 변경"),
        OnOffIconButton(),
      ],
    );
  }
}

///다크모드 토글
///
class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("다크모드 on/off"),
        OnOffIconButton(),
      ],
    );
  }
}

///자동미루기
///
class PostponeTodoToggle extends StatelessWidget {
  const PostponeTodoToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("자동 미루기 on/off"),
        OnOffIconButton(),
      ],
    );
  }
}
