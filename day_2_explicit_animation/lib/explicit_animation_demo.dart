import 'package:flutter/material.dart';

class ExplicitAnimationDemo extends StatefulWidget {
  const ExplicitAnimationDemo({super.key});

  @override
  State<ExplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ExplicitAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    // define tweens

    _sizeAnimation = Tween<double>(begin: 100, end: 200).animate(_controller);

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    // TODO: implement initState
    super.initState();
  }

  _startAnimation() {
    print(_controller.status);
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse(); // Reverse if already completed
    } else {
      _controller.forward(); // Start animation
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animation Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
            );
          },
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, value, child) {
          return FloatingActionButton(
              onPressed: () {
                _startAnimation();
              },
              child: Icon(
                _controller.status == AnimationStatus.completed
                    ? Icons.pause
                    : Icons.play_arrow,
              ));
        },
      ),
    );
  }
}
