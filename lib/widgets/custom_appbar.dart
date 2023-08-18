import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_daily_app/constants/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? rightIcon;
  final VoidCallback? leftButtonAction;
  final VoidCallback? rightButtonAction;

  const CustomAppBar({
    super.key,
    required this.title,
    this.rightIcon,
    this.leftButtonAction,
    this.rightButtonAction,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: const Color(0xff333C49).withOpacity(0.4),
        ),
      ),
      elevation: 0,
      backgroundColor: glaciarWhite,
      centerTitle: true,
      toolbarHeight: kToolbarHeight + 5,
      leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.bars,
              color: nigthBlack,
              size: 30,
            ),
            onPressed: leftButtonAction,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: IconButton(
            icon: Icon(
              rightIcon,
              color: nigthBlack,
              size: 30,
            ),
            onPressed: rightButtonAction,
          ),
        ),
      ],
    );
  }
}
