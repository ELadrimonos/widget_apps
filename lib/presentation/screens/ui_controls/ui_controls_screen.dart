import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {

  static const String name = 'controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen'),
      ),
      // body: const _AnimatedView(),
    );
  }
}