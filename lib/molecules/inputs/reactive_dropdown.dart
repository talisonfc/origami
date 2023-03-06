import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDropdown<T> extends StatelessWidget {
  final String formControlName, label;
  final List<DropdownMenuItem<T>> items;
  final bool isLoading;

  const ReactiveDropdown(
      {super.key,
      required this.formControlName,
      this.items = const [],
      this.isLoading = false,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ReactiveDropdownField<T>(
          items: isLoading
              ? []
              : [const DropdownMenuItem(child: Text('')), ...items],
          formControlName: formControlName,
          isDense: true,
          decoration: InputDecoration(labelText: label),
        ),
        if (isLoading) const LinearProgressIndicator()
      ],
    );
  }
}
