import 'package:flutter/material.dart';

// the path means that the pacman can go through
class MyPath extends StatelessWidget {
  final innerColor;
  final outerColor;
  final child;

  MyPath({
    this.innerColor,
    this.outerColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: EdgeInsets.all(10),
          color: outerColor,
          // outer color
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: innerColor,
                // inner color
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
