import 'package:flutter/material.dart';
class logo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.60);

    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.90, size.width*0.75, size.height * 0.60);
    
    path.quadraticBezierTo(
        size.width*0.75, size.height * 0.60, size.width, size.height * 0.30);
    
    
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}