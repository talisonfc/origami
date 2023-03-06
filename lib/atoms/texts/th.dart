import 'package:flutter/material.dart';

class TH extends StatelessWidget {
  final String value;

  const TH(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
