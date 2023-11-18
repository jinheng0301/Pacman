import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pacman/models/barriers_list.dart';
import 'package:pacman/components/path.dart';
import 'package:pacman/components/pixels.dart';
import 'package:pacman/components/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquare = numberInRow * 17;
  int player = (numberInRow * 15) + 1; // the pacman started position
  String direction = '';

  void startGame() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      switch (direction) {
        case 'left':
          moveLeft();
          break;

        case 'right':
          moveRight();
          break;

        case 'up':
          moveUp();
          break;

        case 'down':
          moveDown();
          break;

        default:
          break;
      }
      if (!barriers.contains(player + 1)) {
        // if any of those numbers is the player's position when you add one, then return false
        setState(() {
          player++;
        });
      }
    });
  }

  void moveLeft() {}
  void moveRight() {}
  void moveUp() {}
  void moveDown() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = 'down';
                } else if (details.delta.dy < 0) {
                  direction = 'up';
                }
                print(direction);
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = 'right';
                } else if (details.delta.dx < 0) {
                  direction = 'left';
                }
                print(direction);
              },
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquare,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (player == index) {
                    return MyPlayer();
                  } else if (barriers.contains(index)) {
                    return MyPixel(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                    );
                  } else {
                    return MyPath(
                      // the food pacman is going to eat
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Score: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                GestureDetector(
                  onTap: startGame,
                  child: Text(
                    'P L A Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
