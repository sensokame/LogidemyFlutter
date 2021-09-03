import 'package:flutter/material.dart';

class ThemeCardPainter extends CustomPainter{
  const ThemeCardPainter({required this.theme, required this.animationValue}) : super();
  final ThemeData theme;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = theme.colorScheme.background
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    // draw few rectangles
    var maxHeight = size.height;
    var maxWidth = size.width;
    var path = Path();
    var x1 = maxWidth*5/100;
    var y1 = maxHeight *5/100;
    var x2 = x1 + maxWidth*35/100;
    var y2 = y1 + maxHeight *15/100;
    var y3 = y2 + y1;
    var x4 = x1 + maxWidth*80/100;
    var y4 = y3 + maxHeight*50/100;
    var y5 = y4 + y1;
    var x6 = x1 + maxWidth*35/100;
    var y6 = y5 + maxHeight *15/100;
    var x7 = x6 + maxWidth*10/100;
    var x8 = x7 + maxWidth*35/100;
    var y9 = y6 + y1;
    var x10 = x1 + maxWidth*80/100;
    var y10 = y9 + maxHeight*50/100;

    path.addRect(
        Rect.fromPoints(
            Offset(x1,y1 - animationValue),
            Offset(x2,y2- animationValue)
        )
    );
    path.addRect(
        Rect.fromPoints(
            Offset(x1, y3- animationValue),
            Offset(x4, y4- animationValue)
        )
    );
    path.addRect(
        Rect.fromPoints(
            Offset(x1, y5- animationValue),
            Offset(x6, y6- animationValue)
        )
    );
    path.addRect(
        Rect.fromPoints(
            Offset(x7, y5- animationValue),
            Offset(x8, y6- animationValue)
        )
    );
    path.addRect(
        Rect.fromPoints(
            Offset(x1, y9- animationValue),
            Offset(x10, y10- animationValue)
        )
    );
    path.close();
    canvas.drawPath(path, paint);
    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}