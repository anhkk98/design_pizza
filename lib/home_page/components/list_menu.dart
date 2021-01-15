import 'dart:ui';

import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  List<String> item = [
    "assets/menu/pizza.png",
    "assets/menu/burger.png",
    "assets/menu/beer.png",
    "assets/menu/ice-cream.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemMenu(Image.asset('assets/menu/pizza.png'),true),
          itemMenu(Image.asset('assets/menu/burger.png'),false),
          itemMenu(Image.asset('assets/menu/beer.png'),false),
          itemMenu(Image.asset('assets/menu/ice-cream.png'),false),
        ],
      ),
    );
  }
  Widget itemMenu(Widget child,bool checkClick) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: GestureDetector(
          onTap: (){

          },
          child: Container(
            color: checkClick ?Colors.yellow[400].withOpacity(0.8):  Colors.white.withOpacity(0.6),
            width: checkClick ? 50 : 45,
            height: checkClick ? 50 : 45,
            padding: EdgeInsets.all(8),
            child: child,
          ),
        ),
      ),
    );
  }
}
