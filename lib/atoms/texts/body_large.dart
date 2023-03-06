import 'package:flutter/material.dart';

class BodyLarge extends StatelessWidget {
  final String value;

  const BodyLarge(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
