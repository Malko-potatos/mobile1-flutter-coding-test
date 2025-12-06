import 'package:flutter/material.dart';

class ReceiverScreen extends StatelessWidget {
  const ReceiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receiver (Desktop)')),
      body: const Center(child: Text('Desktop Laser Pointer Mode')),
    );
  }
}
