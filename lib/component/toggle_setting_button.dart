import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wagle_todo/component/icon_buttons.dart';
import 'package:wagle_todo/providers/calendar_provider.dart';

class OpenToggleSettingDialog extends StatelessWidget {
  const OpenToggleSettingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///20231012-5
    ///토글버튼 콜백함수의 인자.
    ///
    bool isMondayStart = false;
    bool isMonthFormat = true;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///20231012-5
                  ///토글 버튼 콜백함수 구현
                  ///

                  ToggleButton(
                      text: "월요일부터 시작",
                      onPressed: () {
                        isMondayStart = !isMondayStart;
                        context
                            .read<CalendarProvider>()
                            .mondayStart(isMondayStart);
                      }),
                  ToggleButton(
                      text: "달력 형식 변경",
                      onPressed: () {
                        isMonthFormat = !isMonthFormat;
                        context
                            .read<CalendarProvider>()
                            .changeCalendarFormat(isMonthFormat);
                      }),
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
///토글세팅 목록의 텍스트,toggle버튼을 포함하고있는 Row
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
        )
      ],
    );
  }
}
