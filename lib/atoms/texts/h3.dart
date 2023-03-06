import 'package:flutter/material.dart';

class H3 extends StatelessWidget {
  final String value;

  const H3(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
