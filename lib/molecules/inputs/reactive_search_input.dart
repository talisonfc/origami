import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveSearchInput extends StatelessWidget {
  final String? placeholder, formControlName;
  final Function()? onSearch;

  const ReactiveSearchInput(
      {super.key, this.placeholder, this.formControlName, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
        // suffix: Icon(Icons.search),
        isDense: true,
        // isCollapsed: true,
        suffixIcon: Icon(Icons.search),
        // suffix: IconButton(
        //   splashRadius: 16,
        //   iconSize: 16,
        //   visualDensity: VisualDensity.compact,
        //   icon: Icon(Icons.search),
        //   onPressed: onSearch,
        // ),
      ),
    );
  }
}
