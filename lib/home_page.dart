import 'package:flutter/material.dart';
import 'dart:math' show pi;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
//* create AnimationCoontroller object
  late AnimationController _controller;
  late Animation<double> _animation;

//* initialize the aimation
  @override
  void initState() {
    //^
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    //^
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);
    _controller.repeat();

    super.initState();
  }

//* dispose animation
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

//* UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
