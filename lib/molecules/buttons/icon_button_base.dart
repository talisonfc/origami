import 'package:flutter/material.dart';

class IconButtonBase extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Color? color;
  final Color? iconColor;

  const IconButtonBase(
      {super.key,
      this.onPressed,
      required this.icon,
      this.color,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: icon,
          splashRadius: 16,
          color: iconColor,
        ));
  }
}
