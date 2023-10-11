import 'package:flutter/material.dart';

///components
///
import 'package:wagle_todo/component/app_bar.dart';
import 'package:wagle_todo/component/home_calendar.dart';
import 'package:wagle_todo/component/drawer.dart';
import 'package:wagle_todo/component/home_speed_dial.dart';
import 'package:wagle_todo/component/todo_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: HomeSpeedDial(
        selectedDate: selectedDate,
      ),
      appBar: const HomeScreenAppBar(),
      drawer: const ProfileDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeCalendar(
                onDaySelected_: onDaySelected,
                selectedDate: selectedDate,
              ),
              TodoReorderableListView(selectedDate: selectedDate),
            ],
          ),
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
