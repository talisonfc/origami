import 'dart:async';

import 'package:flutter/material.dart';
import 'package:origami/atoms/_exports.dart';
import 'package:origami/molecules/_exports.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: PageState(
        type: PageStateType.empty,
      ),
    ),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Origami',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: TextStyle(
              fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
          headline4: TextStyle(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          headline6: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final requesting = StreamController<bool>();

  final formGroup = fb.group({
    'firstName': FormControl<String>(
        validators: [Validators.required, Validators.minLength(5)]),
    'secondName': FormControl<String>(
        validators: [Validators.required, Validators.minLength(5)])
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const H1('Headline 1'),
              const H2('Headline 2'),
              const H3('Headline 3'),
              const H4('Headline 4'),
              const H5('Headline 5'),
              const H6('Headline 6'),
              const Caption('Caption'),
              const BodyText1('BodyText1'),
              const BodyText2('BodyText2'),
              const BodyLarge('BodyLarge'),
              const BodyMedium('BodyMedium'),
              const BodySmall('BodySmall'),
              StreamBuilder<bool>(
                  stream: requesting.stream,
                  builder: (context, snapshot) {
                    return ButtonWithLoading(
                        label: 'Salvar documento',
                        requestingLabel: 'Salvando documento',
                        requesting: snapshot.data ?? false,
                        onPressed: () {
                          formGroup.markAsDirty();
                          formGroup.markAllAsTouched();
                          requesting.add(true);
                          Future.delayed(const Duration(seconds: 2), () {
                            requesting.add(false);
                          });
                        });
                  }),
              ReactiveForm(
                  formGroup: formGroup,
                  child: Column(
                    children: [
                      ReactiveInput(
                        formControlName: 'firstName',
                        label: 'Primeiro nome',
                      ),
                      ReactiveInput(
                        formControlName: 'secondName',
                        label: 'Segundo nome',
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  @override
  void dispose() {
    requesting.close();
    super.dispose();
  }
}
