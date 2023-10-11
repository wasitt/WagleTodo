import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

///달력시작요일
///
class CalendarStartProvider with ChangeNotifier {
  StartingDayOfWeek _calendarStart = StartingDayOfWeek.monday;
  StartingDayOfWeek get calendarStart => _calendarStart;

  void mondayStart(bool isMondayStart) {
    if (isMondayStart) {
      _calendarStart = StartingDayOfWeek.monday;
    } else {
      _calendarStart = StartingDayOfWeek.sunday;
    }
    notifyListeners();
  }
}

///달력형식
///
class CalendarFormatProvider with ChangeNotifier {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  CalendarFormat get calendarFormat => _calendarFormat;

  void monthFormat(bool isMonthFormat) {
    if (isMonthFormat) {
      _calendarFormat = CalendarFormat.month;
    } else {
      _calendarFormat = CalendarFormat.week;
    }
    notifyListeners();
  }
}
