import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String value;

  const H1(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
