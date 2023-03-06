import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:origami/templates/resource_page/_exports.dart';
import 'package:widgetbook/widgetbook.dart';

class ExampleResourcePage extends ResourcePage {
  ExampleResourcePage({super.key});

  @override
  int get itemCount => 20;

  @override
  Widget itemBuilder(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text('Description $index'),
      ),
    );
  }
}

final resourcePageUseCase = WidgetbookUseCase(
  name: 'ResourcePage',
  builder: (context) {
    return ExampleResourcePage();
  },
);
