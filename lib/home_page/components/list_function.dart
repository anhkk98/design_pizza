import 'package:flutter/material.dart';

class ListFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icon(Icons.home,color: Colors.white,), onPressed: (){print("Trang chủ");}),
            IconButton(icon: Icon(Icons.account_balance_wallet,color: Colors.white,), onPressed: (){print("Ví của bạn");}),
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){print("Giỏ hàng");}),
            IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){print("Chia sẻ");}),
          ],
        ),
      ),
    );
  }
}
