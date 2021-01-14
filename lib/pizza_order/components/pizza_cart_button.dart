import 'package:flutter/material.dart';

class PizzaCartButton extends StatefulWidget {
  final VoidCallback onTap;

  const PizzaCartButton({Key key, this.onTap}) : super(key: key);

  @override
  _PizzaCartButtonState createState() => _PizzaCartButtonState();
}

class _PizzaCartButtonState extends State<PizzaCartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 200),
      lowerBound: 1.0,
      upperBound: 1.5,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void _animationButton() async {
    await _animationController.forward(from: 0.0);
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _animationButton();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: 2 - _animationController.value,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orange.withOpacity(0.5),
              Colors.orange[400],
            ]),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
