import 'package:flutter/material.dart';

class Ring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _RingPainter(),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = (20);
    canvas.drawCircle(Offset.zero, 60, paint);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) => true;
}
