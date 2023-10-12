import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

///20231012-3
///calendar provider 하나로 통합.
///
class CalendarProvider with ChangeNotifier {
  StartingDayOfWeek _calendarStart = StartingDayOfWeek.monday;
  StartingDayOfWeek get calendarStart => _calendarStart;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  CalendarFormat get calendarFormat => _calendarFormat;

  void mondayStart(bool isMondayStart) {
    if (isMondayStart) {
      _calendarStart = StartingDayOfWeek.monday;
    } else {
      _calendarStart = StartingDayOfWeek.sunday;
    }
    notifyListeners();
  }

  void changeCalendarFormat(bool isMonthFormat) {
    if (isMonthFormat) {
      _calendarFormat = CalendarFormat.month;
    } else {
      _calendarFormat = CalendarFormat.week;
    }
    notifyListeners();
  }
}
