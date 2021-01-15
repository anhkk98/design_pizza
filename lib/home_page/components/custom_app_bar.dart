import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(child: Container(alignment:Alignment.centerLeft,child: Icon(Icons.search,size: 30,))),
          Icon(Icons.shopping_cart,size: 30,)
        ],
      ),
    );
  }
}
