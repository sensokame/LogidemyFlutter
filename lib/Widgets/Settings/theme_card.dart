import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logidemy/Widgets/Settings/theme_card_painter.dart';

class ThemeCard extends StatefulWidget{
  const ThemeCard(
  {
    Key? key,
    required this.theme
  }) : super (key: key);
  final ThemeData theme;
  @override
  _ThemeCardState createState() => _ThemeCardState();
}
class _ThemeCardState extends State<ThemeCard> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState(){
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4)
    );
    Tween<double> distanceTween = Tween(begin: 0, end: 50);
    animation = distanceTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
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
    var screen = MediaQuery.of(context).size;
    var screenArea = min(screen.width, screen.height);
    // remove 5% on either side
    var are = (screenArea - (screenArea * 15 / 100)) / 2;
    return Container(
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: are,
            height: are,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot){
                return CustomPaint(
                  painter: ThemeCardPainter(theme : widget.theme, animationValue : animation.value ),
                  willChange: true,
                  child: Container(),
                );
              },
            ) ,
        )
      ),
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface,
            blurRadius: 10.0
          )
        ]
      ),
    );
  }

}