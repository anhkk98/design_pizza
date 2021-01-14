import 'package:design_pizza/pizza_order/pizza_order_detail.dart';
import 'package:flutter/material.dart';

class PizzaOderPage extends StatefulWidget {
  @override
  _PizzaOderPageState createState() => _PizzaOderPageState();
}

class _PizzaOderPageState extends State<PizzaOderPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: PizzaOrderDetail(),
    );
  }
}
