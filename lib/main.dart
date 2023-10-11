import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:wagle_todo/database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:wagle_todo/router/home_router.dart';

import 'package:provider/provider.dart';
import 'package:wagle_todo/providers/calendar_provider.dart';

void main() async {
  await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final homeRouter = HomeRouter;

  ///
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarStartProvider()),
        ChangeNotifierProvider(create: (_) => CalendarFormatProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: homeRouter,
      ),
    ),
  );
}
