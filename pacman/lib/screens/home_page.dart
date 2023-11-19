import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pacman/components/characters/ghost.dart';
import 'package:pacman/models/barriers_list.dart';
import 'package:pacman/components/path.dart';
import 'package:pacman/components/pixels.dart';
import 'package:pacman/components/characters/player.dart';
import 'package:pacman/models/food_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquare = numberInRow * 17;
  int player = (numberInRow * 8) + 5; // the pacman started position
  int ghost = (numberInRow * 2) + 8;
  String direction = '';
  bool preGame = true;
  bool gameHasStarted = false;
  bool mouthClosed = false;
  int score = 0;

  List<int> food = [];

  @override
  void initState() {
    super.initState();
    getFood();
  }

  void startGame() {
    gameHasStarted = true;
    preGame = false;
    getFood();
    Timer.periodic(Duration(milliseconds: 180), (timer) {
      if (direction.isNotEmpty) {
        setState(() {
          mouthClosed = !mouthClosed;
        });
      }

      if (food.contains(player)) {
        setState(() {
          food.remove(player);
          score++;
        });
      }

      if (player == ghost) {
        ghost = -1;
      }

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
    });
  }

  void getFood() {
    for (int i = 0; i < numberOfSquare; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      // if any of those numbers is the player's position when you add one, then return false
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

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
                    // player == index is used to check if the current grid item being built corresponds to the position of the player (pacman) in the grid.
                    // it checks if the current grid item being built is at the same position as the pacman.
                    // it means that the current grid item is the location of the pacman in the grid
                    if (mouthClosed) {
                      return Padding(
                        padding: EdgeInsets.all(4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    } else {
                      // Render pacman with the appropriate rotation
                      switch (direction) {
                        case 'left':
                          return Transform.rotate(
                            angle: pi,
                            child: MyPlayer(),
                          );
                        case 'right':
                          return MyPlayer();
                        case 'up':
                          return Transform.rotate(
                            angle: 3 * pi / 2,
                            child: MyPlayer(),
                          );
                        case 'down':
                          return Transform.rotate(
                            angle: pi / 2,
                            child: MyPlayer(),
                          );
                        default:
                          break;
                      }
                      return MyPlayer();
                    }
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
                  'Score: ' + score.toString(),
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
