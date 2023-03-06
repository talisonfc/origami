import 'package:flutter/material.dart';
import 'package:origami/molecules/_exports.dart';
import 'package:widgetbook/widgetbook.dart';

final buttons = WidgetbookUseCase(
    name: 'Buttons',
    builder: (context) {
      final disabled =
          context.knobs.boolean(label: 'disabled', initialValue: false);
      return Center(
        child: Wrap(
          spacing: 16.0,
          direction: Axis.vertical,
          children: [
            Button(
                label: 'Salvar documento', onPressed: !disabled ? () {} : null),
            ButtonWithLoading(
                label: 'Salvar documento',
                requestingLabel: 'Salvando documento',
                requesting: context.knobs
                    .boolean(label: 'requesting', initialValue: false),
                disabled: disabled,
                onPressed: () {}),
            AddIconButton(
              onPressed: !disabled ? () {} : null,
            ),
            DeleteIconButton(
              onPressed: !disabled ? () {} : null,
            )
          ],
        ),
      );
    });
