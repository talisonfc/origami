import 'package:flutter/material.dart';
import 'package:origami/origami.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class ResourcePage extends StatelessWidget {
  final int itemCount;

  ResourcePage({super.key, this.itemCount = 0});

  Widget itemBuilder(BuildContext context, int index);

  final _formGroup = FormGroup({
    'search': FormControl<String>(value: ''),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CRUD Page')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveForm(
                formGroup: _formGroup,
                child: const ReactiveSearchInput(
                    placeholder: 'Buscar', formControlName: 'search'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: itemBuilder,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithLoading(label: 'Cancelar'),
                  ButtonWithLoading(
                    label: 'Salvar',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
