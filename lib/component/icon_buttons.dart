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

      ///231012-5
      ///기본적으로 클릭할때 아이콘은 전환.
      ///추가적으로 받은 매개변수의 함수 실행.
      ///
      onPressed: () {
        isPressed = !isPressed;
        widget.onPressed?.call();
        setState(() {});
      },
      icon: Icon(isPressed ? widget.onIcon : widget.offIcon),
    );
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
