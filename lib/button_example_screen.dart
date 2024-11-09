// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ButtonExampleScreen extends StatelessWidget {
  const ButtonExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Examples')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => print("ElevatedButton clicked"),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => print("TextButton clicked"),
              child: const Text('Cancel'),
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: const Icon(Icons.headset_rounded),
              onPressed: () => print("IconButton clicked"),
            ),
          ],
        ),
      ),
    );
  }
}
