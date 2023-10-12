import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///터치시 onoff 아이콘 버튼
///디폴트값 토글버튼
///
///
class OnOffIconButton extends StatefulWidget {
  final IconData? onIcon;
  final IconData? offIcon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final void Function()? onPressed; // isPressed를 받도록 수정

  const OnOffIconButton({
    this.onIcon = Icons.toggle_on,
    this.offIcon = Icons.toggle_off_outlined,
    this.iconSize = 30,
    this.padding,
    this.constraints,
    this.onPressed,
    super.key,
  });

  @override
  State<OnOffIconButton> createState() => _OnOffIconButtonState();
}

class _OnOffIconButtonState extends State<OnOffIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.iconSize,
      padding: widget.padding,
      constraints: widget.constraints,

      ///231012-3
      ///o서 onPressed 함수가 주어지지 않았을 때 onPressedBasic 함수가 실행됩니다. 만약 onPressed 함수가 주어진다면 해당 함수가 실행됩니다
      onPressed: widget.onPressed ?? onPressedBasic,
      icon: Icon(isPressed ? widget.onIcon : widget.offIcon),
    );
  }

  ///231012-3
  ///
  void onPressedBasic() {
    isPressed = !isPressed;
    setState(() {});
  }
}

/// 특정 화면으로 이동해주는 Route 버튼
///
class RouteIconButton extends StatelessWidget {
  const RouteIconButton({
    super.key,
    required this.context,
    required this.icon,
    required this.route,
  });

  final BuildContext context;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () => context.go(route),
      icon: Icon(icon),
    );
  }
}

///drawer 여닫이 버튼
///
class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined, size: 30),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
