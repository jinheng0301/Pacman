import 'package:flutter/material.dart';

class MyGhost3 extends StatelessWidget {
  const MyGhost3({super.key});

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
