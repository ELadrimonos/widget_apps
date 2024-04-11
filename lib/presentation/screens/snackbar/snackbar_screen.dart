import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Esto es un snackbar'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 3),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
        // No se puede hacer click fuera de la alerta
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text('No se puede revertir esta accion'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(
                        197, 12, 12, 0.8784313725490196))),
                    child: const Text('Ok'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      children: const [Text("Suspendissenam")]);
                },
                child: const Text("Licencias usadas")),
            const SizedBox(
              height: 40,
            ),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text("Mostrar dialogo")),
          ],
        ),
      ),
    );
  }
}
