import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeChangerScreen'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined)),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> currentColors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
        itemCount: currentColors.length,
        itemBuilder: (context, index) {
          final Color color = currentColors[index];

          return RadioListTile(
              title: Text(
                color.toString(),
                style: TextStyle(color: color),
              ),
              subtitle: Text(color.value.toString()),
              activeColor: color,
              value: index,
              groupValue: selectedColor,
              onChanged: (value) {
                ref
                    .read(selectedColorProvider.notifier)
                    .update((state) => state = value!);
              });
        });
  }
}
