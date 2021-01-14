import 'package:flutter/material.dart';

class SizePizzaButton extends StatelessWidget {
  const SizePizzaButton({Key key, this.selected, this.text, this.onTap})
      : super(key: key);
  final bool selected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]),
            shape: BoxShape.circle,
            boxShadow:selected ? [
              BoxShadow(
                  color: Colors.grey[400], blurRadius: 2, offset: Offset(0, 2))
            ]: null),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: selected ? 16:14
          ),
        ),
      ),
    );
  }
}
