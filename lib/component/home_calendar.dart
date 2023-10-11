import 'package:flutter/material.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wagle_todo/const/text_styles.dart';

///Provider
///
import 'package:provider/provider.dart';
import 'package:wagle_todo/providers/calendar_provider.dart';

class HomeCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected_;
  final DateTime selectedDate;

  const HomeCalendar({
    required this.onDaySelected_,
    required this.selectedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ko_KR",
      weekendDays: const [DateTime.sunday],
      calendarFormat: context.watch<CalendarFormatProvider>().calendarFormat,
      startingDayOfWeek: context.watch<CalendarStartProvider>().calendarStart,
      focusedDay: DateTime.now(),
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(2999, 12, 31),
      //날짜 선택시 실행할 함수
      onDaySelected: onDaySelected_,

      ///e는 순회자 , 현재 화면의 달력의 모든 날을 순회하며
      ///내가 선택한 날짜와 맞는지 찾는다.
      ///e의 year , month, day 가 내가 클릭한 놈의
      ///year, month, day와 맞으면 true를 반환한다.
      selectedDayPredicate: (e) =>
          e.year == selectedDate.year &&
          e.month == selectedDate.month &&
          e.day == selectedDate.day,

      //HeaderStyle
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: MooliRegular(),
      ),
      //daysofweekstyle
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: MooliRegular(),
        weekendStyle: MooliRegular(),
      ),
      //CalendarStyle
      calendarStyle: CalendarStyle(
        tableBorder:
            TableBorder(bottom: BorderSide(color: GREY_COLOR.withOpacity(0.5))),
        isTodayHighlighted: false,
        defaultTextStyle: MooliRegular(),
        weekendTextStyle: MooliRegular().copyWith(color: RED_COLOR),

        ///선택 날짜 디자인
        selectedDecoration: const BoxDecoration(
          color: SELECTED_DATE_COLOR,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: MooliRegular().copyWith(color: WHITE_COLOR),

        //해당 달 제외 날짜 삭제
        outsideDaysVisible: false,
      ),
    );
  }
}
