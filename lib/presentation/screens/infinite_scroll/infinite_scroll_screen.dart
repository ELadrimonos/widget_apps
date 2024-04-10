import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {

  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Screen'),
      ),
      // body: const _AnimatedView(),
    );
  }
}