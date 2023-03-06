import 'package:flutter/material.dart';

class BodySmall extends StatelessWidget {
  final String value;

  const BodySmall(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
