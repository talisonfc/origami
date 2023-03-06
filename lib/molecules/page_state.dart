import 'dart:math';

import 'package:flutter/material.dart';
import 'package:origami/origami.dart';

enum PageStateType { loading, empty, error, data }

class PageState extends StatelessWidget {
  final PageStateType type;
  final String title, subtitle;
  final Widget? action;

  const PageState(
      {super.key,
      this.type = PageStateType.data,
      this.title = '',
      this.subtitle = '',
      this.action});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case PageStateType.loading:
        return background(child: const OrigamiLoading(), title: title);
      case PageStateType.empty:
        return background(
            child: Image.asset('emptyBox.png'),
            title: title,
            subtitle: subtitle,
            action: action);
      case PageStateType.error:
        return background(
            child: Image.asset('http400x.png'), title: title, subtitle: subtitle);
      case PageStateType.data:
        return background(
            child: icon(Icons.data_array), title: title, subtitle: subtitle);
    }
  }

  Widget icon(IconData iconData) {
    return Icon(
      iconData,
      size: 32,
    );
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16),
        child: Icon(
          iconData,
          size: 32,
        ));
  }

  Widget background(
      {required Widget child,
      String title = 'Title',
      String subtitle = '',
      Widget? action}) {
    // return Center(
    //   child: CustomPaint(
    //     painter: PageStateArea(),
    //     child: SizedBox(
    //       width: 100,
    //       height: 100,
    //       child: child,
    //     ),
    //   ),
    // );
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: [
          child,
          H5(title),
          if (subtitle.isNotEmpty) Text(subtitle),
          if (action != null) action
        ],
      ),
    );
  }
}

class PageStateArea extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.orangeAccent, Colors.yellow],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    final w = size.width;
    final h = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    // path.addPolygon([
    //   Offset(0, 0),
    //   Offset(0,w),
    //   Offset(h, 0),
    // ], true);
    // path.addArc(Rect.fromCircle(center: Offset(w/2, h/2), radius: w/2), 0, 3);
    path.arcToPoint(Offset(w/2, h/2), radius: Radius.circular(w/2), clockwise: true);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width / 2, size.height - size.height / 3);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
