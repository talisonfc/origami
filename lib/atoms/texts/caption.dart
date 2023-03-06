import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  final String value;

  const Caption(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
