import 'package:flutter/material.dart';

class SenderScreen extends StatelessWidget {
  const SenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sender (Mobile)')),
      body: const Center(child: Text('Mobile Controller Mode')),
    );
  }
}
