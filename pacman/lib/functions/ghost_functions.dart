// import 'package:pacman/models/barriers_list.dart';

// String ghostLast = '';
// String ghostLast2 = '';
// String ghostLast3 = '';
// int ghost = (numberInRow * 1) + 8; // the ghost started position
// int ghost2 = (numberInRow * 12) + 5;
// int ghost3 = (numberInRow * 6) + 1;
// int numberInRow = 11;

// class GhostFunctions {
//   void moveGhost(int numberInRow, List<int> barriers, int ghost,
//       String ghostLast, Function setState) {
//     switch (ghostLast) {
//       case 'left':
//         if (!barriers.contains(ghost - 1)) {
//           setState(() {
//             ghost--;
//           });
//         } else if (!barriers.contains(ghost + numberInRow)) {
//           setState(() {
//             ghost += numberInRow;
//             ghostLast = "down";
//           });
//         } else if (!barriers.contains(ghost - numberInRow)) {
//           setState(() {
//             ghost -= numberInRow;
//             ghostLast = "up";
//           });
//         } else if (!barriers.contains(ghost + 1)) {
//           setState(() {
//             ghost++;
//             ghostLast = 'right';
//           });
//         }
//         break;

//       case 'right':
//         if (!barriers.contains(ghost + 1)) {
//           setState(() {
//             ghost++;
//           });
//         } else if (!barriers.contains(ghost + numberInRow)) {
//           setState(() {
//             ghost += numberInRow;
//             ghostLast = "down";
//           });
//         } else if (!barriers.contains(ghost - numberInRow)) {
//           setState(() {
//             ghost -= numberInRow;
//             ghostLast = "up";
//           });
//         } else if (!barriers.contains(ghost - 1)) {
//           setState(() {
//             ghost--;
//             ghostLast = 'left';
//           });
//         }
//         break;

//       case 'up':
//         if (!barriers.contains(ghost - numberInRow)) {
//           setState(() {
//             ghost -= numberInRow;
//             ghostLast = 'up';
//           });
//         } else if (!barriers.contains(ghost + numberInRow)) {
//           setState(() {
//             ghost += numberInRow;
//             ghostLast = 'down';
//           });
//         } else if (!barriers.contains(ghost + 1)) {
//           setState(() {
//             ghost++;
//             ghostLast = 'right';
//           });
//         } else if (!barriers.contains(ghost - 1)) {
//           setState(() {
//             ghost--;
//             ghostLast = 'left';
//           });
//         }
//         break;

//       case 'down':
//         if (!barriers.contains(ghost + numberInRow)) {
//           setState(() {
//             ghost += numberInRow;
//             ghostLast = 'down';
//           });
//         } else if (!barriers.contains(ghost - numberInRow)) {
//           setState(() {
//             ghost -= numberInRow;
//             ghostLast = 'up';
//           });
//         } else if (!barriers.contains(ghost + 1)) {
//           setState(() {
//             ghost++;
//             ghostLast = "right";
//           });
//         } else if (!barriers.contains(ghost - 1)) {
//           setState(() {
//             ghost--;
//             ghostLast = 'left';
//           });
//         }
//         break;
//       default:
//         break;
//     }
//   }
// }
