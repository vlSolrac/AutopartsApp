import 'package:flutter/material.dart';

class ImageAnimation extends StatefulWidget {
  final int durationSeconds;
  final double offsetEndX;
  final double offsetEndY;
  final Curve curve;
  final ImageProvider<Object> image;
  final double imageHeight;

  const ImageAnimation({
    super.key,
    this.durationSeconds = 2,
    this.offsetEndX = 0,
    this.offsetEndY = 0.08,
    this.curve = Curves.easeInOut,
    required this.imageHeight,
    required this.image,
  });

  @override
  State<ImageAnimation> createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(widget.offsetEndX, widget.offsetEndY),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  ));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image(
        image: widget.image,
        fit: BoxFit.cover,
        height: widget.imageHeight,
      ),
    );
  }
}
