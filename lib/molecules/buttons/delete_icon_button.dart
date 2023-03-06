import 'package:flutter/material.dart';
import '_exports.dart';

class DeleteIconButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DeleteIconButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonBase(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline_rounded),
      color: Theme.of(context).colorScheme.error,
      iconColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
