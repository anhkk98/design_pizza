import 'package:design_pizza/pizza_order/pizza_order_page.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  String image01 = "assets/pizza/pizza-6.png";
  String image02 = "assets/pizza/pizza-5.png";
  String image03 = "assets/pizza/pizza-3.png";
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                itemVertical(
                  context,
                  image01,
                  "Combo Pizza 01",
                  "Pizza double cheese + Gà lắc phô mai",
                  "185.000 VNĐ",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaOrderPage(image: image01,)));
                  }
                ),
                itemVertical(
                  context,
                  image02,
                  "Combo Pizza 02",
                  "Pizza double cheese + Gà lắc phô mai +2 đùi gà",
                  "225.000 VNĐ",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaOrderPage(image: image02,)));
                  }
                ),
              ],
            ),
            itemHorizontal(context,image03,"Combo Pizza 03","+ Pizza double cheese \n+ Gà lắc phô mai \n+ 2 que tăm","140.000 VNĐ",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaOrderPage(image: image03,)));
            })
          ],
        ));
  }

  Widget itemVertical(
      context, String image, String name, String subTitle, String price,
      {VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width * 0.35,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey, height: 1),
                    ),
                    Text(
                      price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 0,
              left: 0,
              child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 7),
                    )
                  ]),
                  child: Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.33,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemHorizontal(context, String image, String name, String subTitle, String price,
      {VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold,height: 1.5),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey, height: 1),
                    ),
                    Text(
                      price,
                      style: TextStyle(fontWeight: FontWeight.bold,height: 1.5),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
