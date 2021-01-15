import 'package:design_pizza/pizza_order/components/size_pizza.dart';
import 'package:design_pizza/pizza_order/components/size_pizza_button.dart';
import 'package:design_pizza/pizza_order/ingredient.dart';
import 'package:flutter/material.dart';

class PizzaDetail extends StatefulWidget {
  final image;

  const PizzaDetail({Key key, this.image}) : super(key: key);
  @override
  _PizzaDetailState createState() => _PizzaDetailState();
}

class _PizzaDetailState extends State<PizzaDetail>
    with SingleTickerProviderStateMixin {
  final _listIngredient = <Ingredient>[];

  AnimationController _animationController;

  double _money = 15;

  final _notifierFocused = ValueNotifier(false);

  List<Animation> _listAnimation = <Animation>[];

  BoxConstraints _pizzaConstranints;

  final _notifierPizzaSize =
      ValueNotifier<SizePizzaState>(SizePizzaState(SizePizzaValue.m));

  void _buildIngredientAnimation() {
    _listAnimation.clear();
    _listAnimation.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.decelerate)));
    _listAnimation.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 0.9, curve: Curves.decelerate)));
    _listAnimation.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.9, curve: Curves.decelerate)));
    _listAnimation.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.1, 0.7, curve: Curves.decelerate)));
    _listAnimation.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.decelerate)));
  }

  /// wiget animation khi chọn các loại bổ sung
  Widget _buildIngredientWidget() {
    List<Widget> elements = [];
    if (_listAnimation.isNotEmpty) {
      for (int i = 0; i < _listIngredient.length; i++) {
        Ingredient ingredient = _listIngredient[i];
        for (int j = 0; j < ingredient.position.length; j++) {
          final animation = _listAnimation[j];
          final position = ingredient.position[j];
          final positionX = position.dx;
          final positionY = position.dy;

          if (i == _listIngredient.length - 1) {
            double fromX = 0.0, fromY = 0.0;
            if (j < 1) {
              fromX = -_pizzaConstranints.maxWidth * (1 - animation.value);
            } else if (j < 2) {
              fromX = _pizzaConstranints.maxWidth * (1 - animation.value);
            } else if (j < 4) {
              fromY = -_pizzaConstranints.maxHeight * (1 - animation.value);
            } else {
              fromY = _pizzaConstranints.maxHeight * (1 - animation.value);
            }

            if (animation.value > 0) {
              elements.add(Transform(
                transform: Matrix4.identity()
                  ..translate(
                    fromX + _pizzaConstranints.maxWidth * positionX,
                    fromY + _pizzaConstranints.maxHeight * positionY,
                  ),
                child: Image.asset(
                  ingredient.imageAnimation,
                  height: 25,
                ),
              ));
            }
          } else {
            elements.add(Transform(
              transform: Matrix4.identity()
                ..translate(
                  _pizzaConstranints.maxWidth * positionX,
                  _pizzaConstranints.maxHeight * positionY,
                ),
              child: Image.asset(
                ingredient.imageAnimation,
                height: 25,
              ),
            ));
          }
        }
      }
      return Stack(
        children: elements,
      );
    }
    return SizedBox.fromSize();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: DragTarget<Ingredient>(
              onAccept: (val) {
                print("onAccept");
                _notifierFocused.value = false;
                setState(() {
                  _listIngredient.add(val);
                  _money++;
                });
                _buildIngredientAnimation();
                _animationController.forward(from: 0.0);
              },
              // thêm cái mới
              onWillAccept: (val) {
                _notifierFocused.value = true;
                for (Ingredient i in _listIngredient) {
                  if (i.compare(val)) {
                    return false;
                  }
                }

                return true;
              },
              // thêm cãi cũ
              onLeave: (val) {
                _notifierFocused.value = false;
                print("onLeave");
              },
              builder: (context, list, reject) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    _pizzaConstranints = constraints;
                    print(constraints);
                    return ValueListenableBuilder<SizePizzaState>(
                        valueListenable: _notifierPizzaSize,
                        builder: (context, pizzaSize, _) {
                          return Stack(
                            children: [
                              Center(
                                  child: ValueListenableBuilder<bool>(
                                valueListenable: _notifierFocused,
                                builder: (context, focused, _) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    height: focused
                                        ? constraints.maxHeight *
                                            pizzaSize.factor
                                        : constraints.maxHeight *
                                                pizzaSize.factor -
                                            10,
                                    child: Stack(
                                      children: [
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 15,
                                                    offset: Offset(0, 5),
                                                    spreadRadius: 5)
                                              ]),
                                          child: Image.asset(
                                              'assets/pizza/dish.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                              widget.image),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )),
                              AnimatedBuilder(
                                animation: _animationController,
                                builder: (context, _) {
                                  return _buildIngredientWidget();
                                },
                              )
                            ],
                          );
                        });
                  },
                );
              },
            )),
            Text(
              '$_money\$',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            ValueListenableBuilder<SizePizzaState>(
                valueListenable: _notifierPizzaSize,
                builder: (context, pizzaSize, _) {
                  return Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,r
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizePizzaButton(
                        text: 'S',
                        selected: pizzaSize.value == SizePizzaValue.s,
                        onTap: () {
                          _notifierPizzaSize.value =
                              SizePizzaState(SizePizzaValue.s);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizePizzaButton(
                        text: 'M',
                        selected: pizzaSize.value == SizePizzaValue.m,
                        onTap: () {
                          _notifierPizzaSize.value =
                              SizePizzaState(SizePizzaValue.m);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizePizzaButton(
                        text: 'L',
                        selected: pizzaSize.value == SizePizzaValue.l,
                        onTap: () {
                          _notifierPizzaSize.value =
                              SizePizzaState(SizePizzaValue.l);
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }
}
