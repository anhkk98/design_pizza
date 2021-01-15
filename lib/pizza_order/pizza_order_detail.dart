import 'package:design_pizza/pizza_order/components/pizza_cart_button.dart';
import 'package:flutter/material.dart';

import 'components/pizza_detail.dart';
import 'components/pizza_item.dart';

class PizzaOrderDetail extends StatelessWidget {
  final String image;
  double sizeButtonCart = 48;

  PizzaOrderDetail({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Pizza Order",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,), onPressed: (){})
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            right: 10,
            left: 10,
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Expanded(flex: 3,child: PizzaDetail(image: image,)),
                  Expanded(flex: 2,child: PizzaItem(),)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width /2 - sizeButtonCart /2,
            width: sizeButtonCart,
            height: sizeButtonCart,
            child: PizzaCartButton(onTap: (){
              print('cart');
            },),
          )
        ],
      ),
    );
  }
}
