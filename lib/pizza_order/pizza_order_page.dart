import 'package:design_pizza/pizza_order/pizza_order_detail.dart';
import 'package:flutter/material.dart';

class PizzaOrderPage extends StatefulWidget {
  final String image;

  const PizzaOrderPage({Key key, this.image}) : super(key: key);
  @override
  _PizzaOrderPageState createState() => _PizzaOrderPageState();
}

class _PizzaOrderPageState extends State<PizzaOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: PizzaOrderDetail(image: widget.image,),
    );
  }
}
