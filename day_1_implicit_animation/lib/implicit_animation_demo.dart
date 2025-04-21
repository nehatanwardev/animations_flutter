import 'package:flutter/material.dart';

class ImplicitAnimationDemo extends StatefulWidget {
  const ImplicitAnimationDemo({super.key});

  @override
  State<ImplicitAnimationDemo> createState() => _ImplicitAnimationDemoState();
}

class _ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  bool _toggled = false;

  void _toggle() {
    setState(() {
      _toggled = !_toggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Implicit Animation All-in-One")),
      body: Center(
        child: GestureDetector(
          onTap: _toggle,
          child: AnimatedContainer(
            width: _toggled ? 500 : 300,
            height: _toggled ? 500 : 300,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutBack,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _toggled ? Colors.teal : Colors.deepPurple,
              borderRadius: BorderRadius.circular(_toggled ? 40 : 10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  // spreadRadius: 10,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🌀 Image animation
                AnimatedRotation(
                  turns: _toggled ? 1 : 0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: AnimatedScale(
                    scale: _toggled ? 1.2 : 0.8,
                    duration: const Duration(milliseconds: 800),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🎯 Text animations
                AnimatedAlign(
                  duration: const Duration(milliseconds: 600),
                  alignment: _toggled ? Alignment.center : Alignment.topCenter,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: _toggled ? 1.0 : 0.0,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 600),
                      style: TextStyle(
                        fontSize: _toggled ? 22 : 16,
                        color: Colors.white,
                        fontWeight:
                            _toggled ? FontWeight.bold : FontWeight.normal,
                      ),
                      child: const Text("Hello Implicit World 🌍"),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 🔁 Text switcher
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    _toggled ? "Tap to Shrink 👇" : "Tap to Expand 👆",
                    key: ValueKey<bool>(_toggled),
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
