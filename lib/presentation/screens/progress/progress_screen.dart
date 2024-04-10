import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('Circular progress indicator',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.black45,
          ),
          const SizedBox(height: 30),
          Text('Circular y linear progress indicator controlado',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          const _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(
                const Duration(milliseconds: 500), (value) => (value * 2 / 100))
            .takeWhile((value) => value <= 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black12,
                ))
              ],
            ),
          );
        });
  }
}
