import 'package:example/widgetbook/molecules/buttons_usecase.dart';
import 'package:example/widgetbook/molecules/reactive_input_use_case.dart';
import 'package:example/widgetbook/organisms/reactive_inputs_usecase.dart';
import 'package:example/widgetbook/molecules/page_state_usecase.dart';
import 'package:example/widgetbook/templates/resource_page_usecase.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'atoms/atoms.dart';

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(name: 'Atomos', widgets: [atomsComponent]),
        WidgetbookCategory(name: 'Moleculas', widgets: [
          WidgetbookComponent(name: 'Inputs', useCases: [reactiveInputUseCase]),
          WidgetbookComponent(
              name: 'Buttons',
              useCases: [buttons]),
          WidgetbookComponent(name: 'PageState', useCases: [pageStateUseCase])
        ]),
        WidgetbookCategory(name: 'Organismos', widgets: [
          WidgetbookComponent(name: 'ReactiveInputs', useCases: [
            reactiveInputsUsecase,
          ])
        ]),
        WidgetbookCategory(name: 'Templates', widgets: [
          WidgetbookComponent(
              name: 'ResourcePage', useCases: [resourcePageUseCase]),
        ]),
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'Origami'),

      // devices: [
      //   Apple.iPhone11,
      //   Samsung.s21ultra,
      // ]
    );
  }
}
