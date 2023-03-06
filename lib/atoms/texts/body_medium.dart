import 'package:flutter/material.dart';

class BodyMedium extends StatelessWidget {
  final String value;

  const BodyMedium(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
