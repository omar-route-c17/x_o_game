import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget {
  String symbol;
  int index;
  void Function(int) onTap;

  BoardItem({required this.symbol, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: symbol.isEmpty ? null : Image.asset('assets/images/$symbol.png'),
      ),
    );
  }
}
