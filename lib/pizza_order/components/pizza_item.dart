import 'package:flutter/material.dart';

import '../ingredient.dart';

class PizzaItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ingredient.length,
        itemBuilder: (context,index){
          final ingredients = ingredient[index];
          return CustomItem(ingredient: ingredients,);
        },
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final Ingredient ingredient;

  const CustomItem({Key key, this.ingredient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.pink[50],
            shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(ingredient.image),
        ),
      ),
    );
    // TODO: implement build
    return Center(
      child: Draggable(
          feedback: child,
          data: ingredient,
          child: child),
    );
  }
}
