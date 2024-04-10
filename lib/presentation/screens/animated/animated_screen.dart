import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {

  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      // body: const _AnimatedView(),
    );
  }
}