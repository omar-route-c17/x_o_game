import 'package:flutter/material.dart';
import 'package:x_o_game/game_board_screen.dart';
import 'package:x_o_game/welcome_screen.dart';

void main() {
  runApp(XOGame());
}

class XOGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        GameBoardScreen.routeName: (_) => GameBoardScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
