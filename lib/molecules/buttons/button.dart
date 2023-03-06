import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final Widget? child;

  Button({super.key, this.label, this.onPressed, this.child}) {
    assert(label != null || child != null);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: child ?? Text(label!),
    );
  }
}
