import 'package:flutter/material.dart';
import 'package:x_o_game/board_item.dart';

class GameBoardScreen extends StatefulWidget {
  static const String routeName = '/game-board';

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> board = List.filled(9, '');
  late String player1Symbol;
  late String player2Symbol = player1Symbol == 'x' ? 'o' : 'x';
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    player1Symbol = ModalRoute.of(context)!.settings.arguments as String;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Text(
                        '${player1Symbol.toUpperCase()}: $player1Score',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${player2Symbol.toUpperCase()}: $player2Score',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${(round.isOdd ? player1Symbol : player2Symbol).toUpperCase()}'s Turn",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.25,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    itemBuilder: (_, index) => BoardItem(
                      symbol: board[index],
                      index: index,
                      onTap: onItemClicked,
                    ),
                    itemCount: 9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int round = 1;

  void onItemClicked(int index) {
    if (board[index].isNotEmpty) return;

    if (round.isOdd) {
      board[index] = player1Symbol;
      if (checkWinner(player1Symbol)) {
        player1Score++;
        clearBoard();
        return;
      }
    } else {
      board[index] = player2Symbol;
      if (checkWinner(player2Symbol)) {
        player2Score++;
        clearBoard();
        return;
      }
    }

    if (round == 9) {
      clearBoard();
      return;
    }

    round++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (round < 5) return false;

    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }

    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    // 0 1 2
    // 3 4 5
    // 6 7 8
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }

    // 0 3 6
    // 1 4 7
    // 2 5 8
    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }

    return false;
  }

  void clearBoard() {
    board = List.filled(9, '');
    round = 1;
    setState(() {});
  }
}
