import 'dart:math';

import 'package:flutter/material.dart';

class RoundedPictureWidget extends StatefulWidget {
  const RoundedPictureWidget({
    Key? key,
    required this.picture
  }) : super(key: key);
  final String picture;
  @override
  _RoundedPictureWidgetState createState() => _RoundedPictureWidgetState();
}

class _RoundedPictureWidgetState extends State<RoundedPictureWidget> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var screenArea = min(screen.width, screen.height);
    // remove 15% on either side
    var radius = (screenArea - (screenArea * 30 / 100)) / 2;
    return
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)],
        ),
        child: CircleAvatar(
          key: UniqueKey(),
          backgroundImage: NetworkImage(widget.picture),
          radius: radius
        )
      );
  }
}
