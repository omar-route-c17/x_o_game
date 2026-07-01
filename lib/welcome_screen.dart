import 'package:flutter/material.dart';
import 'package:x_o_game/symbol_selection_item.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
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
          top: false,
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.65,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/tic_tac_toe.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  'Tic Tac Toe',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SymbolSelectionItem(symbol: 'x'),
                    SizedBox(width: 16),
                    SymbolSelectionItem(symbol: 'o'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
