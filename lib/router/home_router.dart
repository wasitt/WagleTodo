import 'package:go_router/go_router.dart';

///main screen list
///
///
import 'package:wagle_todo/screen/main_screen/home_screen.dart';
import 'package:wagle_todo/screen/main_screen/notification_screen.dart';
import 'package:wagle_todo/screen/main_screen/shop_screen.dart';

///drawer screen list
///
///
import 'package:wagle_todo/screen/drawer_screen/account_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/information_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/inquiry_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/language_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/notice_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/notification_settings_screen.dart';
import 'package:wagle_todo/screen/drawer_screen/premium_settings_screen.dart';

///shop sub screen list
///
import 'package:wagle_todo/screen/shop_subscreen/category_information_screen.dart';

final GoRouter HomeRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: "shop",
          builder: (context, state) => const ShopScreen(),
        ),
        GoRoute(
          path: "notification",
          builder: (context, state) => const NotificationScreen(),
        ),

        ///drawer screen
        ///
        ///
        GoRoute(
          path: "account_setting",
          builder: (context, state) => const AccountSettingsScreen(),
        ),
        GoRoute(
          path: "information_setting",
          builder: (context, state) => const InformationSettingsScreen(),
        ),
        GoRoute(
          path: "inquiry_setting",
          builder: (context, state) => const InquirySettingsScreen(),
        ),
        GoRoute(
          path: "language_setting",
          builder: (context, state) => const LanguageSettingsScreen(),
        ),
        GoRoute(
          path: "notice_setting",
          builder: (context, state) => const NoticeSettingsScreen(),
        ),
        GoRoute(
          path: "notification_setting",
          builder: (context, state) => const NotificationSettingsScreen(),
        ),
        GoRoute(
          path: "premium_setting",
          builder: (context, state) => const PremiumSettingsScreen(),
        ),

        ///shop sub screen
        ///
        GoRoute(
          path: "category_information",
          builder: (context, state) => const CategoryInformationScreen(),
        ),
      ],
    ),
  ],
);
