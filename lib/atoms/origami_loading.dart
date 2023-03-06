import 'dart:math';

import 'package:flutter/material.dart';

class OrigamiLoading extends StatefulWidget {
  const OrigamiLoading({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OrigamiLoadingState();
  }
}

class OrigamiLoadingState extends State<OrigamiLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 2*pi).animate(controller)
      ..addListener(() {
        if (controller.value == 1) {
          controller.repeat();
        }
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('baseLoading.png'),
      Positioned(
        left: 50 * (1 + sin(animation.value)),
        top: 50 * (1 + cos(animation.value)),
        child: Image.asset('loading.png'),
      )
    ]);
  }
}
