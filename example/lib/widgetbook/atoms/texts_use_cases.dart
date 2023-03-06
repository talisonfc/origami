import 'package:flutter/material.dart';
import 'package:origami/atoms/_exports.dart';
import 'package:widgetbook/widgetbook.dart';

final textsUseCase = WidgetbookUseCase(
    name: 'All',
    builder: (context) {
      return Center(
        child: ListView(
          shrinkWrap: true,
          children: const [
            H1('Headline 1'),
            H2('Headline 2'),
            H3('Headline 3'),
            H4('Headline 4'),
            H5('Headline 5'),
            H6('Headline 6'),
            Caption('Caption'),
            BodyText1('BodyText1'),
            BodyText2('BodyText2'),
            BodyLarge('BodyLarge'),
            BodyMedium('BodyMedium'),
            BodySmall('BodySmall'),
          ],
        ),
      );
    });
