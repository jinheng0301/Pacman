import 'package:flutter/material.dart';

class MyGhost extends StatelessWidget {
  const MyGhost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        'images/ghost.webp',
      ),
    );
  }
}
