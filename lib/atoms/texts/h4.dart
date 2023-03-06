import 'package:flutter/material.dart';

class H4 extends StatelessWidget {
  final String value;

  const H4(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
