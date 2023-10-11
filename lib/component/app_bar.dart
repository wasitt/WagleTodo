import 'package:flutter/material.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:wagle_todo/const/text_styles.dart';
import 'package:wagle_todo/component/toggle_setting_button.dart';
import 'package:wagle_todo/component/icon_buttons.dart';

///HomeScreen의 AppBar
///
class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: OpenDrawerButton(),
      foregroundColor: BLACK_COLOR,
      backgroundColor: WHITE_COLOR,
      elevation: 1.0,
      centerTitle: true,
      title: Container(
          child:
              Image.asset("asset/img/mainlogo.png", width: 110, height: 110)),
      actions: [
        const ToggleSettingButton(),
        const SizedBox(width: 15),
        RouteIconButton(
            context: context, icon: Icons.search_outlined, route: "/shop"),
        const SizedBox(width: 15),
        RouteIconButton(
            context: context,
            icon: Icons.notifications_outlined,
            route: "/notification"),
        const SizedBox(width: 15),
      ],
    );
  }
}

///ShopScreen의 AppBar
///
class ShopScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: WHITE_COLOR,
      foregroundColor: BLACK_COLOR,
      automaticallyImplyLeading: false,
      title: const SearchBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: BLACK_COLOR.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "찾으시려는 카테고리를 입력하세요",
                      hintStyle: TextStyle(
                          fontSize: 15, color: BLACK_COLOR.withOpacity(0.6))),
                ),
              ),
            ),
          ),

          ///취소 버튼
          ///
          TextButton(
            onPressed: () => context.go("/"),
            child: const Text("취소", style: TextStyle(color: BLACK_COLOR)),
          ),
        ],
      ),
    );
  }
}

///NotificationScreen의 AppBar
///
class NotificationScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: WHITE_COLOR,
      foregroundColor: BLACK_COLOR,
      title: Text(
        "Noitfication",
        style: NotoSansKR(FontWeight.w400, 30),
      ),
    );
  }
}

///평범하게 쓰일 AppBar
///
class TextAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const TextAppBar({required this.text, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: WHITE_COLOR,
      foregroundColor: BLACK_COLOR,
      centerTitle: true,
      title: Text(text),
    );
  }
}

///카테고리 설명창 앱바
///
class CategoryInformationScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryInformationScreenAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: RouteIconButton(
          context: context, icon: Icons.arrow_back_ios, route: "/shop"),
      title: const Text("서강대학교 학사일정"),
      elevation: 1.0,
      actions: [
        OnOffIconButton(
            onIcon: Icons.favorite, offIcon: Icons.favorite_border_outlined),
      ],
      backgroundColor: RED_COLOR.withOpacity(0.7),
      foregroundColor: BLACK_COLOR,
      centerTitle: true,
    );
  }
}
