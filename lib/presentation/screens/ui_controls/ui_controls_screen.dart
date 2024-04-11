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
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({
    super.key,
  });

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine, train }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Enable Developer Mode'),
            value: isDeveloper,
            onChanged: (value) {
              isDeveloper = !isDeveloper;
              setState(() {});
            }),

        ExpansionTile(
          title: const Text('Vehiculo de transport'),
          subtitle: Text('${selectedTransportation}'),
          initiallyExpanded: true,

        ),

        RadioListTile(
          title: const Text('En coche'),
          subtitle: const Text('Viaje por coche'),
          value: Transportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) =>
              setState(() => selectedTransportation = Transportation.car),
        ),
        RadioListTile(
          title: const Text('En barco'),
          subtitle: const Text('Viaje por barco'),
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) =>
              setState(() => selectedTransportation = Transportation.boat),
        ),
        RadioListTile(
          title: const Text('En submarino'),
          subtitle: const Text('Viaje por submarino'),
          value: Transportation.train,
          groupValue: selectedTransportation,
          onChanged: (value) =>
              setState(() => selectedTransportation = Transportation.train),
        ),
        RadioListTile(
          title: const Text('En avion'),
          subtitle: const Text('Viaje por avion'),
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) =>
              setState(() => selectedTransportation = Transportation.plane),
        ),
      ],
    );
  }
}
