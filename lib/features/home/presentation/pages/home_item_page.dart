import 'package:flutter/material.dart';

class HomeItemPage extends StatelessWidget {
  const HomeItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Item")),
      body: const Center(child: Text("This is the home item page.")),
    );
  }
}
