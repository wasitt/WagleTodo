import 'package:flutter/material.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:go_router/go_router.dart';

///DRAWER
///
class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: BLACK_COLOR),
            child: UserAccountsDrawerHeader(
              accountName: const Text(
                "최학기",
                style: TextStyle(color: BLACK_COLOR),
              ),
              accountEmail: const Text(
                "chgedward@sogang.ac.kr",
                style: TextStyle(color: BLACK_COLOR),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: WHITE_COLOR,
                backgroundImage: AssetImage("asset/img/서강대학교.png"),
              ),
              arrowColor: BLACK_COLOR,
              otherAccountsPictures: [],
              onDetailsPressed: () => {print("clicked")},
              decoration: const BoxDecoration(
                color: WHITE_COLOR,
              ),
            ),
          ),
          const RouteListTile(
            iconData: Icons.account_circle_outlined,
            text: "계정",
            route: "/account_setting",
          ),
          const RouteListTile(
            iconData: Icons.language_outlined,
            text: "언어",
            route: "/language_setting",
          ),
          const RouteListTile(
            iconData: Icons.video_label_outlined,
            text: "외관",
            route: "/outlook_setting",
          ),
          const RouteListTile(
            iconData: Icons.notifications_outlined,
            text: "알림",
            route: "/notification_setting",
          ),
          const RouteListTile(
            iconData: Icons.diamond_outlined,
            text: "Premium",
            route: "/premium_setting",
          ),
          const RouteListTile(
            iconData: Icons.chat_outlined,
            text: "피드백",
            route: "/feedback_setting",
          ),
          const RouteListTile(
            iconData: Icons.info_outline_rounded,
            text: "정보",
            route: "/information_setting",
          ),
          const RouteListTile(
            iconData: Icons.help_center_outlined,
            text: "문의하기",
            route: "/inquiry_setting",
          ),
        ],
      ),
    );
  }
}

class RouteListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String route;
  const RouteListTile({
    required this.iconData,
    required this.text,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(text),
      onTap: () => context.go(route),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
