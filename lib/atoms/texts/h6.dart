import 'package:flutter/material.dart';

class H6 extends StatelessWidget {
  final String value;

  const H6(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
