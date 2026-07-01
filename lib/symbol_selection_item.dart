import 'package:flutter/material.dart';
import 'package:x_o_game/game_board_screen.dart';

class SymbolSelectionItem extends StatelessWidget {
  String symbol;

  SymbolSelectionItem({required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(GameBoardScreen.routeName, arguments: symbol);
        },
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Image.asset(
            'assets/images/$symbol.png',
            height: MediaQuery.sizeOf(context).height * 0.12,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
