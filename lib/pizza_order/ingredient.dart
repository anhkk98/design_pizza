import 'package:flutter/cupertino.dart';

class Ingredient{
  const Ingredient(this.image,this.imageAnimation, this.position,);
  final String image;
  final String imageAnimation;
  final List<Offset> position;

  bool compare(Ingredient ingredient) => ingredient.image == image;
}

final ingredient = const <Ingredient>[
  Ingredient('assets/pizza_order/chili.png',
      'assets/pizza_animation/chili_unit.png',
  <Offset>[
    Offset(0.25, 0.55),  // left
    Offset(0.7, 0.35),  // right
    Offset(0.45, 0.36),   // center
    Offset(0.5, 0.2),    // top
    Offset(0.65, 0.65),   // bottom
    // Offset(0.55, 0.7),   // bottom
  ]),
  Ingredient(
      'assets/pizza_order/garlic.png',
      'assets/pizza_animation/mushroom_unit.png',
      <Offset>[
        Offset(0.3, 0.35),
        Offset(0.65, 0.35),
        Offset(0.6, 0.65),
        Offset(0.55, 0.2),
        Offset(0.35, 0.5),
        // Offset(0.65, 0.55),
      ]),
  Ingredient('assets/pizza_order/olive.png',
      'assets/pizza_animation/olive_unit.png',
      <Offset>[
        Offset(0.2, 0.45),  // left
        Offset(0.65, 0.45),  // right
        Offset(0.45, 0.41),   // center
        Offset(0.4, 0.2),    // top
        Offset(0.45, 0.65),
        // Offset(0.45, 0.7),// bottom
      ]),
  Ingredient('assets/pizza_order/onion.png',
      'assets/pizza_order/onion.png',
      <Offset>[
        Offset(0.25, 0.65),
        Offset(0.65, 0.3),
        Offset(0.3, 0.25),
        Offset(0.45, 0.35),
        Offset(0.4, 0.65),
        // Offset(0.55, 0.67),
      ]),
  Ingredient('assets/pizza_order/pea.png',
      'assets/pizza_animation/pea_unit.png',
      <Offset>[
        Offset(0.2, 0.35),
        Offset(0.65, 0.35),
        Offset(0.5, 0.67),
        Offset(0.55, 0.2),
        Offset(0.3, 0.5),
        // Offset(0.6, 0.6),
      ]),
  Ingredient('assets/pizza_order/pickle.png',
      'assets/pizza_animation/pickle_unit.png',
      <Offset>[
        Offset(0.2, 0.65),
        Offset(0.65, 0.3),
        Offset(0.3, 0.25),
        Offset(0.45, 0.35),
        Offset(0.4, 0.65),
        // Offset(0.45, 0.75),
      ]),
  Ingredient('assets/pizza_order/potato.png',
      'assets/pizza_animation/cheese.png',
      <Offset>[
        Offset(0.3, 0.2),
        Offset(0.6, 0.2),
        Offset(0.6, 0.65),
        Offset(0.3, 0.5),
        Offset(0.32, 0.65),
        // Offset(0.3, 0.7),
      ]),
];