import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrôle du Tapis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Interface pour contrôler le tapis'),
            // Ajoute ici des widgets spécifiques comme des boutons.
          ],
        ),
      ),
    );
  }
}
