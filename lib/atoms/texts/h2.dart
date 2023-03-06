import 'package:flutter/material.dart';

class H2 extends StatelessWidget {
  final String value;

  const H2(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
