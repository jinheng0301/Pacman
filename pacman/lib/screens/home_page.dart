import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pacman/components/characters/ghost.dart';
import 'package:pacman/components/characters/ghost2.dart';
import 'package:pacman/components/characters/ghost3.dart';
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

  // characters setting
  int player = (numberInRow * 8) + 5; // the pacman started position
  int ghost = (numberInRow * 1) + 8; // the ghost started position
  int ghost2 = (numberInRow * 12) + 5;
  int ghost3 = (numberInRow * 6) + 1;

  // game setting
  bool preGame = true;
  bool gamePaused = false;
  bool gameHasStarted = false;
  bool mouthClosed = false;
  int score = 0;

  //pacman and ghost moving direction
  String direction = '';
  String ghostLast = '';
  String ghostLast2 = '';
  String ghostLast3 = '';

  @override
  void initState() {
    super.initState();
    getFood();
  }

  void moveGhost() {
    switch (ghostLast) {
      case 'left':
        if (!barriers.contains(ghost - 1)) {
          setState(() {
            ghost--;
          });
        } else if (!barriers.contains(ghost + numberInRow)) {
          setState(() {
            ghost += numberInRow;
            ghostLast = "down";
          });
        } else if (!barriers.contains(ghost - numberInRow)) {
          setState(() {
            ghost -= numberInRow;
            ghostLast = "up";
          });
        } else if (!barriers.contains(ghost + 1)) {
          setState(() {
            ghost++;
            ghostLast = 'right';
          });
        }
        break;

      case 'right':
        if (!barriers.contains(ghost + 1)) {
          setState(() {
            ghost++;
          });
        } else if (!barriers.contains(ghost + numberInRow)) {
          setState(() {
            ghost += numberInRow;
            ghostLast = "down";
          });
        } else if (!barriers.contains(ghost - numberInRow)) {
          setState(() {
            ghost -= numberInRow;
            ghostLast = "up";
          });
        } else if (!barriers.contains(ghost - 1)) {
          setState(() {
            ghost--;
            ghostLast = 'left';
          });
        }
        break;

      case 'up':
        if (!barriers.contains(ghost - numberInRow)) {
          setState(() {
            ghost -= numberInRow;
            ghostLast = 'up';
          });
        } else if (!barriers.contains(ghost + numberInRow)) {
          setState(() {
            ghost += numberInRow;
            ghostLast = 'down';
          });
        } else if (!barriers.contains(ghost + 1)) {
          setState(() {
            ghost++;
            ghostLast = 'right';
          });
        } else if (!barriers.contains(ghost - 1)) {
          setState(() {
            ghost--;
            ghostLast = 'left';
          });
        }
        break;

      case 'down':
        if (!barriers.contains(ghost + numberInRow)) {
          setState(() {
            ghost += numberInRow;
            ghostLast = 'down';
          });
        } else if (!barriers.contains(ghost - numberInRow)) {
          setState(() {
            ghost -= numberInRow;
            ghostLast = 'up';
          });
        } else if (!barriers.contains(ghost + 1)) {
          setState(() {
            ghost++;
            ghostLast = "right";
          });
        } else if (!barriers.contains(ghost - 1)) {
          setState(() {
            ghost--;
            ghostLast = 'left';
          });
        }
        break;
      default:
        break;
    }
  }

  void moveGhost2() {
    switch (ghostLast2) {
      case 'left':
        if (!barriers.contains(ghost2 - 1)) {
          setState(() {
            ghost2--;
          });
        } else if (!barriers.contains(ghost2 + numberInRow)) {
          setState(() {
            ghost2 += numberInRow;
            ghostLast2 = "down";
          });
        } else if (!barriers.contains(ghost2 - numberInRow)) {
          setState(() {
            ghost2 -= numberInRow;
            ghostLast2 = "up";
          });
        } else if (!barriers.contains(ghost2 + 1)) {
          setState(() {
            ghost2++;
            ghostLast2 = 'right';
          });
        }
        break;

      case 'right':
        if (!barriers.contains(ghost2 + 1)) {
          setState(() {
            ghost2++;
          });
        } else if (!barriers.contains(ghost2 + numberInRow)) {
          setState(() {
            ghost2 += numberInRow;
            ghostLast2 = "down";
          });
        } else if (!barriers.contains(ghost2 - numberInRow)) {
          setState(() {
            ghost2 -= numberInRow;
            ghostLast2 = "up";
          });
        } else if (!barriers.contains(ghost2 - 1)) {
          setState(() {
            ghost2--;
            ghostLast = 'left';
          });
        }
        break;

      case 'up':
        if (!barriers.contains(ghost2 - numberInRow)) {
          setState(() {
            ghost2 -= numberInRow;
            ghostLast2 = 'up';
          });
        } else if (!barriers.contains(ghost2 + numberInRow)) {
          setState(() {
            ghost2 += numberInRow;
            ghostLast2 = 'down';
          });
        } else if (!barriers.contains(ghost2 + 1)) {
          setState(() {
            ghost2++;
            ghostLast2 = 'right';
          });
        } else if (!barriers.contains(ghost2 - 1)) {
          setState(() {
            ghost2--;
            ghostLast2 = 'left';
          });
        }
        break;

      case 'down':
        if (!barriers.contains(ghost2 + numberInRow)) {
          setState(() {
            ghost2 += numberInRow;
            ghostLast2 = 'down';
          });
        } else if (!barriers.contains(ghost2 - numberInRow)) {
          setState(() {
            ghost2 -= numberInRow;
            ghostLast2 = 'up';
          });
        } else if (!barriers.contains(ghost2 + 1)) {
          setState(() {
            ghost2++;
            ghostLast2 = "right";
          });
        } else if (!barriers.contains(ghost2 - 1)) {
          setState(() {
            ghost2--;
            ghostLast2 = 'left';
          });
        }
        break;
      default:
        break;
    }
  }

  void moveGhost3() {
    switch (ghostLast3) {
      case 'left':
        if (!barriers.contains(ghost3 - 1)) {
          setState(() {
            ghost3--;
          });
        } else if (!barriers.contains(ghost3 + numberInRow)) {
          setState(() {
            ghost3 += numberInRow;
            ghostLast3 = "down";
          });
        } else if (!barriers.contains(ghost3 - numberInRow)) {
          setState(() {
            ghost3 -= numberInRow;
            ghostLast3 = "up";
          });
        } else if (!barriers.contains(ghost3 + 1)) {
          setState(() {
            ghost3++;
            ghostLast3 = 'right';
          });
        }
        break;

      case 'right':
        if (!barriers.contains(ghost3 + 1)) {
          setState(() {
            ghost3++;
          });
        } else if (!barriers.contains(ghost3 + numberInRow)) {
          setState(() {
            ghost3 += numberInRow;
            ghostLast3 = "down";
          });
        } else if (!barriers.contains(ghost3 - numberInRow)) {
          setState(() {
            ghost3 -= numberInRow;
            ghostLast3 = "up";
          });
        } else if (!barriers.contains(ghost3 - 1)) {
          setState(() {
            ghost3--;
            ghostLast3 = 'left';
          });
        }
        break;

      case 'up':
        if (!barriers.contains(ghost3 - numberInRow)) {
          setState(() {
            ghost3 -= numberInRow;
            ghostLast3 = 'up';
          });
        } else if (!barriers.contains(ghost3 + numberInRow)) {
          setState(() {
            ghost3 += numberInRow;
            ghostLast3 = 'down';
          });
        } else if (!barriers.contains(ghost3 + 1)) {
          setState(() {
            ghost3++;
            ghostLast3 = 'right';
          });
        } else if (!barriers.contains(ghost3 - 1)) {
          setState(() {
            ghost3--;
            ghostLast3 = 'left';
          });
        }
        break;

      case 'down':
        if (!barriers.contains(ghost3 + numberInRow)) {
          setState(() {
            ghost3 += numberInRow;
            ghostLast3 = 'down';
          });
        } else if (!barriers.contains(ghost3 - numberInRow)) {
          setState(() {
            ghost3 -= numberInRow;
            ghostLast3 = 'up';
          });
        } else if (!barriers.contains(ghost3 + 1)) {
          setState(() {
            ghost3++;
            ghostLast3 = "right";
          });
        } else if (!barriers.contains(ghost3 - 1)) {
          setState(() {
            ghost3--;
            ghostLast3 = 'left';
          });
        }
        break;
      default:
        break;
    }
  }

  void startGame() {
    gameHasStarted = true;

    getFood();

    Timer.periodic(
      Duration(milliseconds: 180),
      (timer) {
        if (gamePaused) {
          return; // If the game is paused, do nothing
        }

        if (direction.isNotEmpty) {
          setState(() {
            mouthClosed = !mouthClosed;
          });
        }

        if (food.contains(player)) {
          print("Player position: $player");
          print("Food before removal: $food");
          setState(() {
            food.remove(player);
          });
          print("Food after removal: $food");
          score++;
        }

        if (allFoodEaten()) {
          gameHasStarted = false;
          timer.cancel();
          congratulatoryMessage();
        }

        if (pacmanHitsGhost(player, ghost) ||
            pacmanHitsGhost(player, ghost2) ||
            pacmanHitsGhost(player, ghost3)) {
          gameHasStarted = false;
          timer.cancel();
          dialogAlert();
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
      },
    );

    Timer.periodic(
      Duration(milliseconds: 200),
      (timer) {
        if (gamePaused) {
          return; // If the game is paused, do nothing
        }

        moveGhost();
        moveGhost2();
        moveGhost3();

        final randomDirectionIndex = Random().nextInt(4);
        switch (randomDirectionIndex) {
          case 0:
            ghostLast = 'left';
            break;
          case 1:
            ghostLast = 'right';
            break;
          case 2:
            ghostLast = 'up';
            break;
          case 3:
            ghostLast = 'down';
            break;
          default:
            break;
        }

        final randomDirectionIndex2 = Random().nextInt(4);
        switch (randomDirectionIndex2) {
          case 0:
            ghostLast2 = 'left';
            break;
          case 1:
            ghostLast2 = 'right';
            break;
          case 2:
            ghostLast2 = 'up';
            break;
          case 3:
            ghostLast2 = 'down';
            break;
          default:
            break;
        }

        final randomDirectionIndex3 = Random().nextInt(4);
        switch (randomDirectionIndex3) {
          case 0:
            ghostLast3 = 'left';
            break;
          case 1:
            ghostLast3 = 'right';
            break;
          case 2:
            ghostLast3 = 'up';
            break;
          case 3:
            ghostLast3 = 'down';
            break;
          default:
            break;
        }

        if (pacmanHitsGhost(player, ghost) ||
            pacmanHitsGhost(player, ghost2) ||
            pacmanHitsGhost(player, ghost3)) {
          gameHasStarted = false;
          timer.cancel();
          dialogAlert();
        }
      },
    );
  }

  bool allFoodEaten() {
    return food.isEmpty;
  }

  bool pacmanHitsGhost(int pacmanPosition, int ghostPosition) {
    return pacmanPosition == ghostPosition;
  }

  void dialogAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text(
              'G A M E  O V E R',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: restartGame,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.white,
                  child: Text(
                    'P L A Y  A G A I N',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void congratulatoryMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text(
              'C O N G R A T U L A T I O N S',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: restartGame,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.white,
                  child: Text(
                    'P L A Y  A G A I N',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void restartGame() {
    Navigator.pop(context);
    setState(() {
      player = (numberInRow * 8) + 5; // the pacman started position
      ghost = (numberInRow * 1) + 8; // the ghost started position
      ghost2 = (numberInRow * 12) + 5;
      ghost3 = (numberInRow * 6) + 1;
      gameHasStarted = false;
      mouthClosed = false;
      score = 0;
    });
  }

  void pauseGame() {
    setState(() {
      gamePaused = true;
    });

    // Show a dialog with pause options
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text(
              'P A U S E D',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                pauseGame();
                restartGame();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.white,
                  child: Text(
                    'R E S T A R T',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                resumeGame();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.white,
                  child: Text(
                    'R E S U M E',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void resumeGame() {
    setState(() {
      gamePaused = false;
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
              child: Container(
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
                      if (mouthClosed && player == index) {
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
                    } else if (ghost == index) {
                      return MyGhost();
                    } else if (ghost2 == index) {
                      return MyGhost2();
                    } else if (ghost3 == index) {
                      return MyGhost3();
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
          ),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: gamePaused ? resumeGame : pauseGame,
                  child: Icon(
                    gamePaused ? Icons.play_arrow : Icons.pause,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
