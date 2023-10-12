import 'package:flutter/material.dart';
import 'package:wagle_todo/component/icon_buttons.dart';

class OpenToggleSettingDialog extends StatelessWidget {
  const OpenToggleSettingDialog({
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
                  ToggleButton(text: "월요일부터 시작"),
                  ToggleButton(text: "달력 월/주로 보기"),
                  ToggleButton(text: "todo시간 24시간제로 변경"),
                  ToggleButton(text: "Todo 자동 미루기"),
                  ToggleButton(text: "다크모드 on/off"),
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

///20231012-4
///토글세팅의 버튼들 하나로 추출하기.
///
class ToggleButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const ToggleButton({
    this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text!),
        OnOffIconButton(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
