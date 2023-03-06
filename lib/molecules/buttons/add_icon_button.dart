import 'package:flutter/material.dart';
import '_exports.dart';

class AddIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;

  const AddIconButton({super.key, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButtonBase(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      color: color ?? Theme.of(context).colorScheme.primary,
      iconColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
