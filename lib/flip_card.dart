import 'package:flutter/material.dart';
import 'dart:math' show pi;

class FlipContainer extends StatefulWidget {
  const FlipContainer({super.key});

  @override
  State<FlipContainer> createState() => _FlipContainerState();
}

class _FlipContainerState extends State<FlipContainer>
    with SingleTickerProviderStateMixin {
  //^ creating objects
  late AnimationController _controller;
  late Animation _animation;

  //^ initilize State
  @override
  void initState() {
    //* initializing control objects
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    //* initializing animation objects
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(_animation.value),
          child: Container(
            width: screenSize.height * 0.1,
            height: screenSize.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
