import 'package:flutter/material.dart';

class GameSessionIndexPage extends StatelessWidget {
  const GameSessionIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games')),
      body: const Center(child: Text('Games list (placeholder)')),
    );
  }
}
