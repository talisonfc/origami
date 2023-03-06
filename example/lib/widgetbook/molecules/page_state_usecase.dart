import 'package:origami/molecules/_exports.dart';
import 'package:widgetbook/widgetbook.dart';

final pageStateUseCase = WidgetbookUseCase(
  name: 'PageState',
  builder: (context) {
    return PageState(
      type: context.knobs.options(label: 'type', options: const [
        Option(label: 'empty', value: PageStateType.empty),
        Option(label: 'loading', value: PageStateType.loading),
        Option(label: 'error', value: PageStateType.error),
        Option(label: 'data', value: PageStateType.data),
      ]),
      title: context.knobs.text(label: 'title', initialValue: 'Title'),
      subtitle: context.knobs.text(label: 'subtitle', initialValue: 'Subtitle'),
    );
  },
);
