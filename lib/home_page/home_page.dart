import 'package:design_pizza/home_page/components/custom_app_bar.dart';
import 'package:design_pizza/pizza_order/pizza_order_page.dart';
import 'package:flutter/material.dart';

import 'components/item_product.dart';
import 'components/list_function.dart';
import 'components/list_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink[200],
              Colors.grey[300],
              // Colors.purple[200],
              // Colors.grey[300],
              Colors.blue[100],
              Colors.pink[200]

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pizza Hoàng Anh",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,height: 1.5),),
                  Text("Chúng tôi làm Pizza với thực phẩm tươi và lành mạnh!",style: TextStyle(fontStyle: FontStyle.italic),)
                ],
              ),
            ),
            ListMenu(),
            ItemProduct(),
            ListFunction()

          ],
        )
      ),
    );
  }
}
