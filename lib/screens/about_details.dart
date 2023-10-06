import 'package:flutter/material.dart';

class AboutDetailsPage extends StatelessWidget {
  const AboutDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutDetailsPage'),
      ),
      body: const Center(
        child: Text('AboutDetailsPage Page Content'),
      ),
    );
  }
}
