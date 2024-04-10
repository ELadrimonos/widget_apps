import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Elevated'),
          ),
          TextButton(onPressed: () {}, child: const Text('Text')),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Text'),
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Outlined'),
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Filled'),
          ),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Tonal'),
          ),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('Tonal'),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_sharp)),
          const IconButton(
              onPressed: null,
              icon: Icon(Icons.ac_unit_sharp),
              disabledColor: Colors.red),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ac_unit_sharp),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colors.primary),
                iconColor: MaterialStateProperty.all(Colors.white)),
          ),
          const CustomButton(),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          hoverColor: colors.inversePrimary,
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,  vertical: 10),
            child: Text("Hola", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
